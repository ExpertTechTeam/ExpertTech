//
//  OverViewTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {
    @IBOutlet weak var vImageTitle:UIImageView!
    @IBOutlet weak var vTitle:UILabel!
    @IBOutlet weak var vStatus:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
