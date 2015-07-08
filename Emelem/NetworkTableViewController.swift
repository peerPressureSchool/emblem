//
//  NetworkTableViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 7/7/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class NetworkTableViewController: UITableViewController {
    
    var networkKeptProducts: [NetworkKeptProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Your Network"
        
        fetchNetworkKeptProducts({
            returnedNetworkKeptProducts in
            self.networkKeptProducts = returnedNetworkKeptProducts
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
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return networkKeptProducts.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell: SearchCell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as! SearchCell
            
            return cell
        } else if indexPath.section == 1 {
            let cell2: BroadcastCell = tableView.dequeueReusableCellWithIdentifier("BroadcastCell", forIndexPath: indexPath) as! BroadcastCell
            return cell2
        } else {
            let cell3: ProductCell4 = tableView.dequeueReusableCellWithIdentifier("ProductCell4", forIndexPath: indexPath) as! ProductCell4
            
            let product = networkKeptProducts[indexPath.row].product
            println(product)
            
            cell3.productNameLabel.text = product.productName
            product.getProductPhoto({
                productImage in
                cell3.productImageView.image = productImage
            })
            cell3.productPriceLabel.text = "$\(product.price)"
            cell3.brandNameLabel.text = product.brandName
            cell3.shipPriceLabel.text = "+ $\(product.shippingCost)S&H"
            cell3.chatButton.tag = indexPath.row
            cell3.mapButton.tag = indexPath.row
            
            return cell3
        }
    }


    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 114
        } else if indexPath.section == 1 {
            return 86
        } else {
            return 511
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
