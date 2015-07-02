//
//  ProfileViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 5/8/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: UIImage(named: "profile-header"))
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav-back-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "exitProfileVC:")
        navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = currentUser()?.fullName
        currentUser()?.getPhoto({
            image in
            self.profileImageView.layer.masksToBounds = true
            self.profileImageView.contentMode = .ScaleAspectFill
            self.profileImageView.image = image
        })
        
        //this is bad code...should not be in viewDidLoad
        getNumberOfKepts()
        getNumberOfFollowers()
        getNumberOfFollowing()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func exitProfileVC(button: UIBarButtonItem){
        pageController.goToNextVC()
    }
    
    
    //get numbers for stats area
    func getNumberOfKepts() {
        PFQuery(className: "Action")
            .whereKey("byUser", equalTo: PFUser.currentUser()!.objectId!)
            .whereKey("type", equalTo: "kept")
            .findObjectsInBackgroundWithBlock({
                objects, error in
                if let keptProducts = objects as? [PFObject] {
                    let myKeptProducts = keptProducts.map({
                        (object: PFObject)->(keptID: String, productSKU:String)
                        in
                        (object.objectId! as String, object.objectForKey("productSku") as! String)
                    })
                    self.likeCountLabel.text = "\(myKeptProducts.map({$0.productSKU}).count)"
                }
            })
    }
    
    func getNumberOfFollowers() {
        PFQuery(className: "Relationship")
            .whereKey("recipient", equalTo: PFUser.currentUser()!.objectId!)
            .whereKey("type", equalTo: "follow")
            .findObjectsInBackgroundWithBlock({
                objects, error in
                if let relationships = objects as? [PFObject] {
                    let myRelationships = relationships.map({
                        (object: PFObject)->(relationshipID: String, followerID:String)
                        in
                        (object.objectId! as String, object.objectForKey("doer") as! String)
                    })
                    self.followerCountLabel.text = "\(myRelationships.map({$0.followerID}).count)"
                }
            })
    }
    
    func getNumberOfFollowing() {
        PFQuery(className: "Relationship")
            .whereKey("doer", equalTo: PFUser.currentUser()!.objectId!)
            .whereKey("type", equalTo: "follow")
            .findObjectsInBackgroundWithBlock({
                objects, error in
                if let relationships = objects as? [PFObject] {
                    let myRelationships = relationships.map({
                        (object: PFObject)->(relationshipID: String, followingID:String)
                        in
                        (object.objectId! as String, object.objectForKey("recipient") as! String)
                    })
                    self.followingCountLabel.text = "\(myRelationships.map({$0.followingID}).count)"
                }
            })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shippingVCSegue" {
            let shippingListVC: ShippingTableViewController = segue.destinationViewController as! ShippingTableViewController
            shippingListVC.title = "Manage Shipping Addresses"
        }
    }

}



