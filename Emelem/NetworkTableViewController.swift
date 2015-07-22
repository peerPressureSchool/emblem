//
//  NetworkTableViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 7/7/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class NetworkTableViewController: UITableViewController {
    
    var isFiltered = false
    
    var networkKeptProducts: [NetworkKeptProduct] = []
    var keptProducts: [KeptProduct] = []
    
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
        
        if isFiltered == false {
            fetchNetworkKeptProducts({
                returnedNetworkKeptProducts in
                self.networkKeptProducts = returnedNetworkKeptProducts
                self.tableView.reloadData()
            })
        } else {
            fetchKeptProducts({
                returnedKeptProducts in
                self.keptProducts = returnedKeptProducts
                self.tableView.reloadData()
            })
        }
        
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
        if isFiltered == false {
            return networkKeptProducts.count
        } else {
            return keptProducts.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
            let cell: ProductCell4 = tableView.dequeueReusableCellWithIdentifier("ProductCell4", forIndexPath: indexPath) as! ProductCell4
        
            if isFiltered == false {
                var product = networkKeptProducts[indexPath.row].product
                cell.productNameLabel.text = product.productName
                product.getProductPhoto({
                    productImage in
                    cell.productImageView.image = productImage
                })
                //cell.productPriceLabel.text = "$\(product.price)"
                cell.brandNameLabel.text = product.brandName
                //cell.shipPriceLabel.text = "+ $\(product.shippingCost)S&H"
                cell.chatButton.tag = indexPath.row
                cell.mapButton.tag = indexPath.row
                return cell
            } else {
                var product = keptProducts[indexPath.row].product
                cell.productNameLabel.text = product.productName
                product.getProductPhoto({
                    productImage in
                    cell.productImageView.image = productImage
                })
                //cell.productPriceLabel.text = "$\(product.price)"
                cell.brandNameLabel.text = product.brandName
                //cell.shipPriceLabel.text = "+ $\(product.shippingCost)S&H"
                cell.chatButton.tag = indexPath.row
                cell.mapButton.tag = indexPath.row
                return cell
            }
    }


    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 511
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chatVCSegue" {
            let chatVC: ChatViewController = segue.destinationViewController as! ChatViewController
            let networkKeptProduct = self.networkKeptProducts[sender!.tag]
            chatVC.keptProductSKU = networkKeptProduct.sku
            chatVC.title = networkKeptProduct.product.productName
        } else if segue.identifier == "mapVCSegue" {
            let mapVC: MapViewController = segue.destinationViewController as! MapViewController
            let networkKeptProduct = self.networkKeptProducts[sender!.tag]
            mapVC.keptProductSKU = networkKeptProduct.sku
            mapVC.title = networkKeptProduct.product.productName
        } else if segue.identifier == "detailsVCSegue" {
            let detailsVC: ProductDetailViewController = segue.destinationViewController as! ProductDetailViewController
            let networkKeptProduct = self.networkKeptProducts[sender!.tag]
            detailsVC.productSku = networkKeptProduct.sku
            detailsVC.title = networkKeptProduct.product.productName
        }
    }
    
    @IBAction func filterButtonPressed(sender: AnyObject) {
        if isFiltered == false {
            isFiltered = true
            
            fetchKeptProducts({
                returnedKeptProducts in
                self.keptProducts = returnedKeptProducts
                self.tableView.reloadData()
            })
            
            
            println(isFiltered)
        } else {
            isFiltered = false
            
            fetchNetworkKeptProducts({
                returnedNetworkKeptProducts in
                self.networkKeptProducts = returnedNetworkKeptProducts
                self.tableView.reloadData()
            })
            
            println(isFiltered)
        }
    }
    
    
    
}
