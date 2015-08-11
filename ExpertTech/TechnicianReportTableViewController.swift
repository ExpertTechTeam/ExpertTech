//
//  TechnicianReportTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/3/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class TechnicianReportTableViewController: UITableViewController, communicationControllerStatus, communicationControllerRootCause, UIPopoverPresentationControllerDelegate {
  
    @IBOutlet weak var vStatusLabel: UILabel!
    @IBOutlet weak var vRootCauseLabel: UILabel!

    @IBOutlet weak var vNoteTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        //do som stuff from the popover
    }
    
    func backFromSelectedStatus(statusId: Int) {
        
        let statusFilePath = NSBundle.mainBundle().pathForResource("WorkOrderStatus", ofType: "plist")
        let statusArray = NSArray(contentsOfFile: statusFilePath!)!
        vStatusLabel.text = String(statusArray[statusId].objectForKey("status_name_en")!)
        vStatusLabel.textColor = UIColor.blackColor()
        
    }
    
    func backFromSelectedRootCause(rootCauseId: Int) {
        let rootCauseFilePath = NSBundle.mainBundle().pathForResource("RootCause", ofType: "plist")
        let rootCauseArray = NSArray(contentsOfFile: rootCauseFilePath!)!
        vRootCauseLabel.text = String(rootCauseArray[rootCauseId].objectForKey("rootcause_name")!)
        vRootCauseLabel.textColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "workOrderStatusSegue" {
            let workOrderStatusVC: WorkOrderStatus1TableViewController = (segue.destinationViewController as! WorkOrderStatus1TableViewController)
            workOrderStatusVC.delegate = self
           /* workOrderStatusVC.modalPresentationStyle = .Popover
            workOrderStatusVC.popoverPresentationController?.permittedArrowDirections =  UIPopoverArrowDirection.Up
            workOrderStatusVC.preferredContentSize = CGSizeMake(280, 320)
            workOrderStatusVC.popoverPresentationController?.delegate = self
            workOrderStatusVC.popoverPresentationController?.sourceView = self.view
            //workOrderStatusVC.popoverPresentationController?.sourceRect = CGRectMake(0, 50, 0, 0)
            self.presentViewController(workOrderStatusVC, animated: true, completion: nil)*/
        }else if segue.identifier == "rootCauseSegue" {
            let workOrderRootCauseVC: RootCauseTableViewController = (segue.destinationViewController as! RootCauseTableViewController)
            workOrderRootCauseVC.delegate = self
        }
        
    }
    
    @IBAction func technicalSignOff(){
        let alertController = UIAlertController(title: "", message: "To conplete the report, hand the iPad to your customer to Signoff", preferredStyle: UIAlertControllerStyle.Alert)
        let okButton =  UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                self.performSegueWithIdentifier("customerSignOffSegue", sender: nil)
            
            }
        )
        alertController.addAction(okButton)
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
