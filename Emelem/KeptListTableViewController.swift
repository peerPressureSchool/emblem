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
        navigationItem.title = currentUser()?.fullName
        
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
        cell.chatButton.tag = indexPath.row
        cell.mapButton.tag = indexPath.row
        cell.detailsButton.tag = indexPath.row
        
        return cell
    }
    

    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }*/
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chatVCSegue" {
            let chatVC: ChatViewController = segue.destinationViewController as! ChatViewController
            let keptProduct = self.keptProducts[sender!.tag]
            chatVC.keptProductSKU = keptProduct.sku
            chatVC.title = keptProduct.product.productName
        } else if segue.identifier == "mapVCSegue" {
            let mapVC: MapViewController = segue.destinationViewController as! MapViewController
            let keptProduct = self.keptProducts[sender!.tag]
            mapVC.keptProductSKU = keptProduct.sku
            mapVC.title = keptProduct.product.productName
        } else if segue.identifier == "detailsVCSegue" {
            let detailsVC: ProductDetailViewController = segue.destinationViewController as! ProductDetailViewController
            let keptProduct = self.keptProducts[sender!.tag]
            detailsVC.productSku = keptProduct.sku
            detailsVC.title = keptProduct.product.productName
        }
    }
}
