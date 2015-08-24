//
//  PopOverDetailMapTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/14/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class PopOverDetailMapTableViewController: UITableViewController {

    @IBOutlet weak var vCustomerDetailTxtView: UITextView!
    @IBOutlet weak var vWorkOderNoBarBtn: UIBarButtonItem!
    @IBOutlet weak var vNavigationBar: UINavigationBar!
    var indexNumber:Int = 0
    var workOrderId:Int = 0
    override func viewDidLoad() {
        print("Popover")
        super.viewDidLoad()
        self.vNavigationBar.barTintColor = Constants.Color.toolbar_bg
            //Constants.Color.LightGray_BG
        //self.vNavigationBar.tintColor = UIColor.blueColor()
        self.vWorkOderNoBarBtn.tintColor = Constants.Color.midnightblue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    @IBAction func onSelectedDetail(sender: AnyObject) {
        print("on select detail")
    }
    */
    
    
    
    @IBAction func onSelectWorkOrder(sender: AnyObject) {
        print("on select work order \(indexNumber), work order id \(workOrderId)")
        let dict: [String : AnyObject] = ["indexNumber" : indexNumber - 1 as Int]
        NSNotificationCenter.defaultCenter().postNotificationName("selectedFromMapPin", object: nil, userInfo: dict)
        self.dismissViewControllerAnimated(false, completion: nil)

    }


}
