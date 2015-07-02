//
//  NetworkKeptProductTableViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 6/3/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class NetworkKeptProductTableViewController: UITableViewController {

    var networkKeptProducts: [NetworkKeptProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "profile-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "goToProfile:")
        navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
        navigationItem.title = "Your Network"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "profile-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "goToProfile:")
        navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
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
    
    func goToProfile(button: UIBarButtonItem) {
        pageController.goToPreviousVC()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 0 {
            return 1
        } else {
            return networkKeptProducts.count
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 1 ? "Your Friends Like This..." : "Find Friends Using..."
        return title
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        if indexPath.section == 0 {
            let cell: NetworkCell = tableView.dequeueReusableCellWithIdentifier("NetworkCell", forIndexPath: indexPath) as! NetworkCell
            return cell
        } else {
            
            
            let cell2 = tableView.dequeueReusableCellWithIdentifier("ProductCell2", forIndexPath: indexPath) as! ProductCell2
            
            let product = networkKeptProducts[indexPath.row].product
            println(product)
            
            cell2.productNameLabel.text = product.productName
            product.getProductPhoto({
                productImage in
                cell2.productImageView.image = productImage
            })
            cell2.productPriceLabel.text = "$\(product.price)"
            cell2.brandNameLabel.text = product.brandName
            cell2.shipPriceLabel.text = "+ $\(product.shippingCost)S&H"
            cell2.chatButton.tag = indexPath.row
            cell2.mapButton.tag = indexPath.row
            
            
            return cell2
        }
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }*/


}
