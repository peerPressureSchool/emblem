//
//  SearchCell.swift
//  Emelem
//
//  Created by Jared Mermey on 7/7/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var fbDirectionStaticLabel: UILabel!
    @IBOutlet weak var shwopDirectionStaticLabel: UILabel!
    
    
    
    @IBOutlet weak var fbFriendSearchButton: UIButton!
    @IBOutlet weak var shwoppSearchForPeopleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
