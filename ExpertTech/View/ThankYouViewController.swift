//
//  ThankYouViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/11/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
class ThankYouViewController: UIViewController {
    
    var isHiddenBackBtn:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.hidden = false
        self.view.backgroundColor = Constants.Color.LightGray
        self.navigationItem.setHidesBackButton(isHiddenBackBtn, animated: false)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
