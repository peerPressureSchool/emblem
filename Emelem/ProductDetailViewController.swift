//
//  ProductDetailViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 7/2/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var productSku: String?
    var product: [Product] = []
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
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
    
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
