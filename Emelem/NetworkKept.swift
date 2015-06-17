//
//  NetworkKept.swift
//  Emelem
//
//  Created by Jared Mermey on 6/5/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import Foundation

struct NetworkKeptProduct {
    let sku: String
    let product: Product
}

var relatedUserIDs: [String] = []

func fetchNetworkKeptProducts( callback: ([NetworkKeptProduct]) -> ()){
    
    //find relationships from CurrentUser
    PFQuery(className: "Relationship")
        .whereKey("doer", equalTo: PFUser.currentUser()!.objectId!)
        .whereKey("type", equalTo: "follow")
        .findObjectsInBackgroundWithBlock({
            objects, error in
            if let relationships = objects as? [PFObject] {
                println(relationships)
                for relationship in relationships {
                    let relatedUserID = relationship["recipient"] as! String
                    relatedUserIDs.append(relatedUserID)
                }
            }
        })
    
    
    //first Query isolates products that have been kept from Action class into an array
    PFQuery(className: "Action")
        .whereKey("byUser", containedIn: relatedUserIDs)
        .whereKey("type", equalTo: "kept")
        .findObjectsInBackgroundWithBlock({
            objects, error in
            if let networkKeptProducts = objects as? [PFObject] {
                let myNetworkKeptProducts = networkKeptProducts.map({
                    (object: PFObject)->(keptID: String, productSKU:String)
                    in
                    (object.objectId! as String, object.objectForKey("productSku") as! String)
                })
                let productIDs = myNetworkKeptProducts.map({$0.productSKU})
                
                
                //second query gets all of the information about each product in the array from the Product class
                PFQuery(className: "Product")
                    .whereKey("sku", containedIn: productIDs)
                    .findObjectsInBackgroundWithBlock({
                        objects, error in
                        if let products = objects as? [PFObject] {
                            var products = reverse(products)
                            var m = Array<NetworkKeptProduct>()
                            for (index, product) in enumerate(products){
                                m.append(NetworkKeptProduct(sku: myNetworkKeptProducts[index].productSKU, product: productToProduct(product)))
                            }
                            println(m)
                            for i in m {
                                let sku = i.sku
                                println(sku)
                            }
                            callback(m)
                        }
                    })
            }
        })
}