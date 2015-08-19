//
//  TechniacalReportTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class TechniacalReportTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bounds = CGRectMake(self.bounds.origin.x,
            self.bounds.origin.y,
            self.bounds.size.width - 80,
            self.bounds.size.height);
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = Constants.Color.LightGray.CGColor

    }

}
