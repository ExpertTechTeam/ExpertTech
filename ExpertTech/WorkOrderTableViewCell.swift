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
        let bgView = UIView()
        if selected == true {
            bgView.backgroundColor = UIColor(hex: 0x0168A2)
            self.selectedBackgroundView = bgView
            self.vOrderType1.textColor = UIColor.whiteColor()
            self.vOrderType2.textColor = UIColor.whiteColor()
            self.vSequence.textColor = UIColor.whiteColor()
        }else{
            bgView.backgroundColor = UIColor.whiteColor()
            self.selectedBackgroundView = bgView
            self.vOrderType1.textColor = UIColor(hex: 0x0168A2)
            self.vOrderType2.textColor = UIColor(hex: 0x0168A2)
            self.vSequence.textColor = UIColor(hex: 0x0168A2)
        }
    }

}
