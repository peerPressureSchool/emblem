//
//  CardView.swift
//  Emelem
//
//  Created by Jared Mermey on 5/4/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    
    //product Info
    private let productImageView: UIImageView = UIImageView()
    private let productNameLabel: UILabel = UILabel()
    private let brandNameLabel: UILabel = UILabel()
    private let productPriceLabel: UILabel = UILabel()
    private let shipPriceLabel: UILabel = UILabel()
    
    //referrer info
    private let referrerImageView: UIImageView = UIImageView()
    private let referrerNameLabel: UILabel = UILabel()
    private let referrerCountLabel: UILabel = UILabel()
    
    //action icons (TBD)
    //ADD ACTION ICONS
    
    
    var productName: String? {
        didSet{
            if let productName = productName{
                productNameLabel.text = productName
            }
        }
    }
    
    var productImage: UIImage? {
        didSet{
            if let productImage = productImage{
                productImageView.image = productImage
            }
        }
        
    }
    
    
    //initializers for CardView
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    
    init(){
        super.init(frame: CGRectZero)
        initialize()
    }
    
    //function to set up all images and labels
    private func initialize(){
        
        //everytime we create a CardView, we immediately create subviews of images and labels
        productImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        productImageView.backgroundColor = UIColor.redColor()
        addSubview(productImageView)
        
        productNameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(productNameLabel)
        
        brandNameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(brandNameLabel)
        
        productPriceLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(productPriceLabel)
        
        shipPriceLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(shipPriceLabel)
        
        referrerImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        referrerImageView.backgroundColor = UIColor.redColor()
        addSubview(referrerImageView)
        
        referrerNameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(referrerNameLabel)
        
        referrerCountLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(referrerCountLabel)
        
        //design for CardView (colors, outline, rounded edges)
        backgroundColor = UIColor.whiteColor()
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGrayColor().CGColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        setConstraints()
    }
    
    
    private func setConstraints() {
        
        //CONSTRAINTS FOR PRODUCTIMAGEVIEW --> self = CardVie
        //how productImageView relates to CardView (i.e., "self") from top (i.e., y position)
        addConstraint(NSLayoutConstraint(item: productImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        //how productImageView relates to CardView from left (i.e., X position)
        addConstraint(NSLayoutConstraint(item: productImageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0))
        //how wide productImageView is
        addConstraint(NSLayoutConstraint(item: productImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        //how tall productImageView is
        addConstraint(NSLayoutConstraint(item: productImageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))
        
        //CONSTRAINTS FOR PRODUCTNAMELABEL
        addConstraint(NSLayoutConstraint(item: productNameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: productImageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: productNameLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10))
        addConstraint(NSLayoutConstraint(item: productNameLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10))
        addConstraint(NSLayoutConstraint(item: productNameLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10))
        
        
        
    }

}