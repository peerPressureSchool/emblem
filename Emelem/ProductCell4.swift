//
//  ProductCell4.swift
//  Emelem
//
//  Created by Jared Mermey on 7/7/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ProductCell4: UITableViewCell {
    
    @IBOutlet weak var referrerImageView: UIImageView!
    @IBOutlet weak var referrerNameLabel: UILabel!
    @IBOutlet weak var referrerCountLabel: UILabel!
    @IBOutlet weak var referreredByStaticLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var shipPriceLabel: UILabel!
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        referrerImageView.layer.cornerRadius = referrerImageView.frame.height / 2
        referrerImageView.layer.masksToBounds = true
        
        self.referreredByStaticLabel.font = UIFont(name: "Helvetica-Light", size: 10.0)
        self.referrerNameLabel.font = UIFont(name: "Helvetica-Light", size: 10.0)
        self.referrerCountLabel.font = UIFont(name:"Helvetica-Light" , size: 13.0)
        
        self.productNameLabel.textColor = UIColor.cyanColor()
        self.productNameLabel.font = UIFont(name: "Helvetica-Bold", size: 22.0)
        self.productPriceLabel.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        self.brandNameLabel.font = UIFont(name: "Helvetica", size: 14.0)
        self.shipPriceLabel.font = UIFont(name: "Helvetica", size: 14.0)
        
        self.productImageView.layer.borderColor = UIColor.grayColor().CGColor
        self.productImageView.layer.borderWidth = 1.5
        
        self.buyButton.layer.cornerRadius = 15.0
        self.buyButton.layer.borderColor = UIColor.grayColor().CGColor
        self.buyButton.layer.borderWidth = 1.5
    }

}
