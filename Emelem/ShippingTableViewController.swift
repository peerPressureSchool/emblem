//
//  ShippingTableViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 6/10/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ShippingTableViewController: UITableViewController {

    var shippingAddresses: [ShippingAddress] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserAddresses({
            shippingAddresses in
            self.shippingAddresses = shippingAddresses
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //let cellCount = self.shippingAddresses.count + 1
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ShippingCell", forIndexPath: indexPath) as! ShippingCell
        //let address = shippingAddresses[indexPath.row]
        
        
        cell.shippingAddTitleLabel.text = "Add a shipping address "
        // Configure the cell...
//        if (indexPath.row == shippingAddresses.count + 1) {
//            
//        } else {
//         cell.shippingAddTitleLabel.text = address.addressName
//        }

        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //...write the code to go to the shipping address VC
        //look at how bitfountain does this in matches VC
        
            let addDetailsVC = ShipAddDetailViewController()
                //navigationController?.pushViewController(addDetailsVC, animated: true)
        
            self.performSegueWithIdentifier("shipDetailVCSegue", sender: indexPath)
        
            if self.shippingAddresses.count > 0 {
                addDetailsVC.address = shippingAddresses[indexPath.row]
            }
        
            addDetailsVC.title = "Edit Your Address"
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}
