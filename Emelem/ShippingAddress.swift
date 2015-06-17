//
//  ShippingAddress.swift
//  Emelem
//
//  Created by Jared Mermey on 6/9/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import Foundation

struct ShippingAddress {
    
    let addressName: String
    let streetAddress: String
    let apt: String
    let city: String
    let state: String
    let zip: String
    private let shippingAddress: PFObject

}



func shippingAddressToShippingAddress (shippingAddress: PFObject) -> ShippingAddress {
    return ShippingAddress(addressName: shippingAddress.objectForKey("addressTitle") as! String, streetAddress: shippingAddress.objectForKey("streetAddress") as! String, apt: shippingAddress.objectForKey("apt") as! String, city: shippingAddress.objectForKey("city") as! String, state: shippingAddress.objectForKey("state") as! String, zip: shippingAddress.objectForKey("zip") as! String, shippingAddress: shippingAddress)
}


func fetchUserAddresses( callback: ([ShippingAddress]) -> ()) {
    var query = PFQuery(className: "Address")
    query.whereKey("user", equalTo: PFUser.currentUser()!.objectId!)
    query.findObjectsInBackgroundWithBlock({
        objects, error in
        if let addressesFromParse = objects as? [PFObject] {
            let addresses = map(addressesFromParse, {shippingAddressToShippingAddress($0)})
            callback(addresses)
        }
    })
}




func saveAddress(shippingAddress: ShippingAddress){
    let save = PFObject(className: "Address")
    
    save.setObject(PFUser.currentUser()!.objectId!, forKey: "user")
    save.setObject(shippingAddress.addressName, forKey: "addressName")
    save.setObject(shippingAddress.streetAddress, forKey: "streetAddress")
    save.setObject(shippingAddress.apt, forKey: "apt")
    save.setObject(shippingAddress.city, forKey: "city")
    save.setObject(shippingAddress.state, forKey: "state")
    save.setObject(shippingAddress.zip, forKey: "zip")
    save.saveInBackgroundWithBlock(nil)
}