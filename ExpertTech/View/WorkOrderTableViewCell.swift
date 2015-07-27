//
//  WorkOrderTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class WorkOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var sequence:UILabel!
    @IBOutlet weak var orderName:UILabel!
    @IBOutlet weak var orderNo:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.didAddSubview(sequence)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
