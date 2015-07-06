//
//  PeripheralsCell.swift
//  Emelem
//
//  Created by Jared Mermey on 7/3/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class PeripheralsCell: UITableViewCell {

    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var creditcardButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var referButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
