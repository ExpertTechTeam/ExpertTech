//
//  StartDoneWorkOrderButton.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/4/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class StartDoneWorkOrderButton: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }

    required init?(coder aDecoder: (NSCoder!)) {
        
        super.init(coder: aDecoder)
        layer.bounds = CGRectMake(0, 0, 150, 35)
        layer.borderWidth = 1.0;
        layer.cornerRadius = 6.0;
        layer.borderColor = Constants.Color.Blue.CGColor
        self.tintColor = UIColor.whiteColor()
        self.setTitleColor(Constants.Color.Blue, forState: UIControlState.Normal)
    }
   
    
    func onTouchDownStart(){
        layer.backgroundColor = Constants.Color.Blue.CGColor
        layer.borderColor = Constants.Color.Blue.CGColor
        self.titleLabel?.textColor = UIColor.whiteColor()
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    func onTouchUpStart(){
        layer.backgroundColor = UIColor.whiteColor().CGColor
        layer.borderColor = UIColor.redColor().CGColor
        self.setTitle("Done", forState: UIControlState.Normal)
        self.titleLabel?.textColor = UIColor.redColor()
        self.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
    }
    
    func onTouchDownDone(){
        layer.backgroundColor = UIColor.redColor().CGColor
        layer.borderColor = UIColor.redColor().CGColor
        self.titleLabel?.textColor = UIColor.whiteColor()
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    func onTouchUpDone(){
        layer.backgroundColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 1.0;
        layer.cornerRadius = 4.0;
        layer.borderColor = UIColor.redColor().CGColor
        self.titleLabel?.textColor = UIColor.redColor()
        self.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    }
}
