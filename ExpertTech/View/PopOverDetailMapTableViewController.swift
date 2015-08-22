//
//  PopOverDetailMapTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/14/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class PopOverDetailMapTableViewController: UITableViewController {

    @IBOutlet weak var vNavigationBar: UINavigationBar!
    var indexNumber:Int = 0
    var workOrderId:Int = 0
    override func viewDidLoad() {
        print("Popover")
        super.viewDidLoad()
        self.vNavigationBar.barTintColor = Constants.Color.LightGray_BG
        self.vNavigationBar.tintColor = UIColor.blueColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSelectedDetail(sender: AnyObject) {
        print("on select detail")
    }
    @IBAction func onSelectWorkOrder(sender: AnyObject) {
        print("on select work order \(indexNumber), work order id \(workOrderId)")
        let dict: [String : AnyObject] = ["indexNumber" : indexNumber as Int, "workOrderId" : workOrderId as Int]
        /*if identifier == "String" {
            passedString = array[indexPath.row] as? String
            dict = ["String" : array[indexPath.row] as String]
        }
        if identifier == "Int" {
            passedInt = array[indexPath.row] as? Int
            dict = ["Int" : array[indexPath.row] as Int]
        }
        */
        NSNotificationCenter.defaultCenter().postNotificationName("workOrderListChange", object: nil, userInfo: dict)
        self.dismissViewControllerAnimated(false, completion: nil)

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
    }*/

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
