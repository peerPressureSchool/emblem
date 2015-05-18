//
//  Product.swift
//  Emelem
//
//  Created by Jared Mermey on 5/14/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import Foundation

struct Product {
    let productName: String
    let brandName: String
    let sku: String
    let price: Double
    let shippingCost: Double
    let productDescription: String
    private let product: PFObject
    
    func getProductPhoto(callback:(UIImage) -> () ){
        let imageFile = product.objectForKey("productImage") as! PFFile
        imageFile.getDataInBackgroundWithBlock({
            data, error in
            if let data = data {
                callback(UIImage(data:data)!)
            }
        })
    }
    
    func getBrandPhoto(callback:(UIImage) -> () ){
        let imageFile = product.objectForKey("brandImage") as! PFFile
        imageFile.getDataInBackgroundWithBlock({
            data, error in
            if let data = data {
                callback(UIImage(data:data)!)
            }
        })
    }
    
}

func productToProduct (product: PFObject) -> Product {
    return Product(productName: product.objectForKey("productName") as! String, brandName: product.objectForKey("brandName") as! String, sku: product.objectForKey("sku") as! String, price: product.objectForKey("price") as! Double, shippingCost: product.objectForKey("shippingCost") as! Double, productDescription: product.objectForKey("productLongDescription") as! String, product: product)
}


//need to test this to see if it works. NO IDEA.
func fetchUnviewedProducts( callback: ([Product]) -> ()) {
    var query = PFQuery(className: "Product")
    query.findObjectsInBackgroundWithBlock({
    objects, error in
        if let productsFromParse = objects as? [PFObject] {
            let products = map(productsFromParse, {productToProduct($0)})
            callback(products)
        }
    })
}