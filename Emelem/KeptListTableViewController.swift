//
//  KeptListTableViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 5/18/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class KeptListTableViewController: UITableViewController {

    var keptProducts: [KeptProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "profile-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "goToProfile:")
        navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
        
        fetchKeptProducts({
            keptProducts in
            self.keptProducts = keptProducts
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return keptProducts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell

        let product = keptProducts[indexPath.row].product
        cell.productNameLabel.text = product.productName
        product.getProductPhoto({
            productImage in
            cell.productImageView.image = productImage
        })
        cell.productPriceLabel.text = "$\(product.price)"
        cell.brandNameLabel.text = product.brandName
        cell.shipPriceLabel.text = "+ $\(product.shippingCost)S&H"
        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
