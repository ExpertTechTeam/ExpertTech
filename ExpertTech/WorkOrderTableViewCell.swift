//
//  WorkOrderTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class WorkOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var vSequence:UILabel!
    @IBOutlet weak var vOrderType1:UILabel!
    @IBOutlet weak var vOrderType2:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
