//
//  ProductCell.swift
//  Emelem
//
//  Created by Jared Mermey on 5/18/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var referrerImageView: UIImageView!
    @IBOutlet weak var referrerNameLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var shipPriceLabel: UILabel!
    
    @IBOutlet weak var chatButton: UIButton!
    
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
    }
    

    


}
