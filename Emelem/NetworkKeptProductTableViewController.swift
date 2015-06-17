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
            networkKeptProducts in
            self.networkKeptProducts = networkKeptProducts
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
            let cell2: ProductCell = tableView.dequeueReusableCellWithIdentifier("NetProductCell", forIndexPath: indexPath) as! ProductCell
            let product = networkKeptProducts[indexPath.row].product
            cell2.productNameLabel.text = product.productName
            return cell2
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


}
