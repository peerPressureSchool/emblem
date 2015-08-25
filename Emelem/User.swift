//
//  User.swift
//  Emelem
//
//  Created by Jared Mermey on 5/8/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let name: String
    let fullName: String
    private let pfUser: PFUser
    
    func getPhoto( callback:(UIImage) -> () ){
        let imageFile = pfUser.objectForKey("picture") as! PFFile
        imageFile.getDataInBackgroundWithBlock({
            data, error in
            if let data = data {
                callback(UIImage(data:data)!)
            }
        })
    }
    
}

private func pfUsertoUser (user: PFUser) -> User {
    return User(id: user.objectId!, name: user.objectForKey("firstName") as! String, fullName: user.objectForKey("fullName") as! String,pfUser: user)
}

func currentUser() -> User? {
    if let user = PFUser.currentUser() {
        return pfUsertoUser(user)
    }
    return nil
}

//TEST FOR CHAT

func getUserAsync(userID: String, callback: (User) -> () ) {
    PFUser.query()?.whereKey("objectId", equalTo: userID).getFirstObjectInBackgroundWithBlock( { (object, error) -> Void in
        if let pfUser = object as? PFUser {
            let user = pfUsertoUser(pfUser)
            callback(user) }
    })
}

// END TEST

