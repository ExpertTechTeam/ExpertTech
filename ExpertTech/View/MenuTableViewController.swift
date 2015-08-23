//
//  MenuTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//  

import UIKit

class MenuTableViewController: UITableViewController, UISplitViewControllerDelegate {
    var isSelectedFromMap:Bool = false
    var isCompletedWork:Bool = false
    var openWorkOrderList = Constants.WorkOrderList.workOrderList
    var closeWorkOrderList = [WorkOrder]()
    var indexNumber:Int = 0
    var workOrderId:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        print("View Did Load")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "workOrderListChangeMethod:", name: "workOrderListChange", object: nil)
        tableView.registerNib(UINib(nibName: "OverViewTableViewCell", bundle: nil), forCellReuseIdentifier: "overViewCell")
        tableView.registerNib(UINib(nibName: "WorkOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "workOrderCell")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        print("View did appear")
    }
    
    func workOrderListChangeMethod(notif: NSNotification) {
        print("Work Order List Change")
        

        isSelectedFromMap = true
        if let passedInt: AnyObject = notif.userInfo?["indexNumber"] {
            indexNumber = passedInt as! Int - 1
        }
        if let passedInt: AnyObject = notif.userInfo?["workOrderId"] {
            workOrderId = passedInt as! Int
        }
        if let isFromCompleteWork: AnyObject = notif.userInfo?["isCompletedWork"] {
            isCompletedWork = isFromCompleteWork as! Bool
        }
        print("index number : \(indexNumber), work order id : \(workOrderId)")

        if isCompletedWork {
            let animations1: () -> Void = {
                self.splitViewController?.preferredDisplayMode = .Automatic
                self.splitViewController?.viewWillLayoutSubviews()
                self.splitViewController?.view.layoutSubviews()
                
            }
            UIView.animateWithDuration(0.7, delay: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations1) { (Bool) -> Void in
            }
            /*
            self.tableView.beginUpdates()
            self.tableView.reloadSections(NSIndexSet(index: 1), withRowAnimation: UITableViewRowAnimation.Top)
            self.tableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Top)
            
            self.tableView.endUpdates()*/
            let completedWorkOrder = self.openWorkOrderList[self.indexNumber]
            self.openWorkOrderList.removeAtIndex(self.indexNumber)
            self.closeWorkOrderList.append(completedWorkOrder)
            
        }
        self.tableView.reloadData()

    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "workOrderListChange", object:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }else if section == 1 {
            return openWorkOrderList.count
        }else{
            return closeWorkOrderList.count
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        }else{
            return 50
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
            performSegueWithIdentifier("overViewSegue", sender: nil)
            let dict: [String : AnyObject] = ["title" : "Daily Overview" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }
        if isSelectedFromMap || isCompletedWork {
            if indexPath.section == 1 && indexNumber == indexPath.row {
                tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                performSegueWithIdentifier("workOrderSegue", sender: nil)
                let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
                NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        isSelectedFromMap = false
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedCell!.setSelected(true, animated: false)
        if indexPath.section == 0 && indexPath.row == 0 {
            performSegueWithIdentifier("overViewSegue", sender: nil)
            //self.dismissViewControllerAnimated(false, completion: nil)
            let dict: [String : AnyObject] = ["title" : "Daily Overview" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }else if indexPath.section == 1 || indexPath.section == 2{
            self.indexNumber = indexPath.row
            self.workOrderId = Constants.WorkOrderList.workOrderList[indexPath.row].woo_id
            performSegueWithIdentifier("workOrderSegue", sender: nil)
            let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }
    }
    
    // if tableView is set in attribute inspector with selection to multiple Selection it should work.
    
    // Just set it back in deselect
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cellToDeSelect = tableView.cellForRowAtIndexPath(indexPath)
        cellToDeSelect!.setSelected(false, animated: false)
    }

    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0 {
            return "OVERVIEW"
        }else if section == 1{
            return "OPEN WORK ORDERS"
        }else{
            return "COMPLETED WORK ORDERS"
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("overViewCell", forIndexPath: indexPath) as! OverViewTableViewCell
            if indexPath.row == 0 {
                cell.vImageTitle.image = UIImage(named: "menu_dashboard.png")
                cell.vTitle.text = "Dashboard"
                cell.vStatus.text = ""
                
            }else{
                cell.vImageTitle.image = UIImage(named: "menu_vehicle.png")
                cell.vTitle.text = "Vehicle"
                cell.vStatus.text = "Selected"
            }
            return cell
        }else if indexPath.section == 1{
            let workOrder = openWorkOrderList[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier("workOrderCell", forIndexPath: indexPath) as! WorkOrderTableViewCell
            cell.vOrderType1.text = workOrder.woo_latitude
            cell.vOrderType2.text = workOrder.woo_longitude
            cell.vSequence.text = String(indexPath.row + 1)
            return cell
        } else {
            let workOrder = closeWorkOrderList[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier("workOrderCell", forIndexPath: indexPath) as! WorkOrderTableViewCell
            cell.vSequenceImg.image = nil
            cell.vOrderType1.text = workOrder.woo_latitude
            cell.vOrderType2.text = workOrder.woo_longitude
            cell.vSequence.text = ""
            cell.vOrderType1.textColor = UIColor.grayColor()
            cell.vOrderType2.textColor = UIColor.grayColor()
            return cell
        }

    }

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
        if segue.identifier == "workOrderSegue"{
            print("open work order segue")
            let controller:DetailWorkOrderViewController = segue.destinationViewController as! DetailWorkOrderViewController
            controller.workOrderId = self.workOrderId
            controller.indexNumber = self.indexNumber
            
            //var indexPath = self.tableview.indexPathForSelectedRow() //get index of data for selected row
            
//secondViewController.data = self.dataArray.objectAtIndex(indexPath.row) // get data by index and pass it to second view controller
            
        }else if segue.identifier == "overViewSegue"{
            print("Over view segue")
        }
    }
    
    

}
