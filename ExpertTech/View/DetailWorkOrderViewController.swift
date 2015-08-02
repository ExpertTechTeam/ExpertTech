//
//  DetailWorkOrderViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/2/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class DetailWorkOrderViewController: UIViewController, UISplitViewControllerDelegate {
    var hideMaster:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func hideTrigger() {
        self.hideMaster = !self.hideMaster
        let spv:UISplitViewController = self.splitViewController!
        spv.view.setNeedsLayout()
        spv.delegate = nil;
        spv.delegate = self;
      //  spv.willRotateToInterfaceOrientation(self.interfaceOrientation, duration: 2000)
    }
    
    func splitViewController(svc: UISplitViewController, shouldHideViewController vc: UIViewController, inOrientation orientation: UIInterfaceOrientation) -> Bool {
        return self.hideMaster
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
