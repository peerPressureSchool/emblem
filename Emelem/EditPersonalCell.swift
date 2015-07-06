//
//  EditPersonalCell.swift
//  Emelem
//
//  Created by Jared Mermey on 7/3/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class EditPersonalCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var referredCountLabel: UILabel!
    @IBOutlet weak var baggedItemsCountLabel: UILabel!
    @IBOutlet weak var commissionDollarsLabel: UILabel!
    
    @IBOutlet weak var followersStaticLabel: UILabel!
    @IBOutlet weak var followingStaticLabel: UILabel!
    @IBOutlet weak var referredStaticLabel: UILabel!
    @IBOutlet weak var baggedStaticLabel: UILabel!
    @IBOutlet weak var commissionStaticLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
