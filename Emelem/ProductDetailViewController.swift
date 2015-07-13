//
//  ProductDetailViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 7/2/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var productSku: String?
    var product: [Product] = []
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shippingCost: UILabel!
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var checkoutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(productSku)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        fetchProductBySk(productSku!, {
            returnedProduct in
            self.product = returnedProduct
            
            self.product[0].getProductPhoto({
                    productImage in
                    self.productImage.image = productImage
                    self.productImage.contentMode = .ScaleAspectFill
                
                }
            )
            self.productDescription.text = self.product[0].productDescription
            self.price.text = "$\(self.product[0].price)"
            self.shippingCost.text = "$\(self.product[0].shippingCost)"
            self.productNameLabel.text = self.product[0].productName
            self.brandNameLabel.text = self.product[0].brandName
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CheckoutCell = tableView.dequeueReusableCellWithIdentifier("CheckoutCell", forIndexPath: indexPath) as! CheckoutCell
        
        
        switch (indexPath.row) {
            case 0:
                cell.checkoutFieldLabel.text == "Size"
                return cell
            case 1:
                cell.checkoutFieldLabel.text == "Color"
                return cell
            case 2:
                cell.checkoutFieldLabel.text == "Address"
                return cell
            case 3:
                cell.checkoutFieldLabel.text == "Card"
                return cell
            case 4:
                cell.checkoutFieldLabel.text == "Buy"
                return cell
            default:
                break;
        }
        
        return cell
        
        /*if indexPath == 0 {
            cell.checkoutFieldLabel.text = "Size"
            return cell
        } else if indexPath == 1 {
            cell.checkoutFieldLabel.text = "Color"
            return cell
        } else if indexPath == 2 {
            cell.checkoutFieldLabel.text = "Address"
            return cell
        } else if indexPath == 3 {
            cell.checkoutFieldLabel.text = "Card"
            return cell
        } else {
            cell.checkoutFieldLabel.text = "Buy"
            return cell
        }*/
    }

    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        <#code#>
    }*/

}
