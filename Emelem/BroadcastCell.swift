//
//  BroadcastCell.swift
//  Emelem
//
//  Created by Jared Mermey on 7/7/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class BroadcastCell: UITableViewCell {

    @IBOutlet weak var directionStaticLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var fbPostButton: UIButton!
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
