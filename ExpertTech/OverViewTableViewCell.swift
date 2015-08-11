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
        let bgView = UIView()
        if selected == true {
            bgView.backgroundColor = Constants.Color.Blue
            self.selectedBackgroundView = bgView
            self.vStatus.textColor = UIColor.greenColor()
            self.vTitle.textColor = UIColor.whiteColor()
        }else{
            bgView.backgroundColor = UIColor.whiteColor()
            self.selectedBackgroundView = bgView
            self.vStatus.textColor = UIColor.greenColor()
            self.vTitle.textColor = Constants.Color.Blue
        }
        // Configure the view for the selected state
    }
}
