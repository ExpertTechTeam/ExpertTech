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
    var completedWorkOrderList = [WorkOrder]()
    var indexNumber:Int = 0
    var curWorkOrder:WorkOrder!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selectedFromMapPinMethod:", name: "selectedFromMapPin", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "completedWorkOrderMethod:", name: "completedWorkOrder", object: nil)
        tableView.registerNib(UINib(nibName: "OverViewTableViewCell", bundle: nil), forCellReuseIdentifier: "overViewCell")
        tableView.registerNib(UINib(nibName: "OpenWorkOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "openWorkOrderCell")
        tableView.registerNib(UINib(nibName: "CompletedWorkOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "completedWorkOrderCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Notification
    
    func selectedFromMapPinMethod(notif: NSNotification) {
        print("selected from map pin")
        self.isSelectedFromMap = true
        self.isCompletedWork = false
        if let passedInt: AnyObject = notif.userInfo?["indexNumber"] {
            self.indexNumber = passedInt as! Int
        }
        print("index number : \(indexNumber)")

        self.tableView.reloadData()

    }
    func completedWorkOrderMethod(notif: NSNotification) {
        print("completed work order method")
        self.isCompletedWork = true
        self.isSelectedFromMap = false
        if let passedInt: AnyObject = notif.userInfo?["indexNumber"] {
            self.indexNumber = passedInt as! Int
        }
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
        self.completedWorkOrderList.append(completedWorkOrder)
        
        self.tableView.reloadData()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "selectedFromMapPin", object:nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "completedWorkOrder", object:nil)
    }

    // MARK: - Table view data source and delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1 {
            return openWorkOrderList.count
        }else{
            return completedWorkOrderList.count > 0 ? completedWorkOrderList.count : 1
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
        if indexPath.section == 0  {
            if indexPath.row == 0 {
                tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                performSegueWithIdentifier("overViewSegue", sender: nil)
                let dict: [String : AnyObject] = ["title" : "Daily Overview" as String]
                NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
            }
            
        }else if indexPath.section == 1 {
            if isSelectedFromMap  {
                if indexPath.row == indexNumber {
                    print("section == 1")
                    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                    self.curWorkOrder = self.openWorkOrderList[indexPath.row]
                    performSegueWithIdentifier("workOrderSegue", sender: nil)
                    let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
                    NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
                }
            }
            if isCompletedWork {
                if indexPath.row == 0 {
                    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                    performSegueWithIdentifier("workOrderSegue", sender: nil)
                    self.curWorkOrder = self.openWorkOrderList[indexPath.row]
                    let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
                    NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        isSelectedFromMap = false
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedCell!.setSelected(true, animated: false)
        if indexPath.section == 0 && indexPath.row == 0 {
            performSegueWithIdentifier("overViewSegue", sender: nil)
            let dict: [String : AnyObject] = ["title" : "Daily Overview" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }else if indexPath.section == 1{
            self.indexNumber = indexPath.row
            //self.workOrderId = Constants.WorkOrderList.workOrderList[indexPath.row].woo_id
            self.curWorkOrder = self.openWorkOrderList[indexPath.row]
            performSegueWithIdentifier("workOrderSegue", sender: nil)
            let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }else if indexPath.section == 2{
            self.indexNumber = indexPath.row
            //self.workOrderId = Constants.WorkOrderList.workOrderList[indexPath.row].woo_id
            self.curWorkOrder = self.completedWorkOrderList[indexPath.row]
            performSegueWithIdentifier("workOrderSegue", sender: nil)
            let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }
    }
    
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
            let cell = tableView.dequeueReusableCellWithIdentifier("openWorkOrderCell", forIndexPath: indexPath) as! OpenWorkOrderTableViewCell
            cell.vOrderType1.text = workOrder.woo_latitude
            cell.vOrderType2.text = workOrder.woo_longitude
            cell.vSequence.text = String(indexPath.row + 1)
            return cell
        } else {
            if completedWorkOrderList.count > 0 {
                let workOrder = completedWorkOrderList[indexPath.row]
                let cell = tableView.dequeueReusableCellWithIdentifier("completedWorkOrderCell", forIndexPath: indexPath) as! CompletedWorkOrderTableViewCell
                cell.vOrderType1.text = workOrder.woo_latitude
                cell.vOrderType2.text = workOrder.woo_longitude
                return cell
            }else{
                let cell = UITableViewCell()
                cell.textLabel!.text = "You have no completed work orders"
                cell.textLabel!.textColor = UIColor.grayColor()
                cell.textLabel!.font = UIFont.italicSystemFontOfSize(13.0)
                cell.userInteractionEnabled = false
                return cell
            }

        }

    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "workOrderSegue"{
            print("open work order segue")
            let controller:DetailWorkOrderViewController = segue.destinationViewController as! DetailWorkOrderViewController
           // controller.workOrderId = self.workOrderId
            controller.indexNumber = self.indexNumber
            controller.curWorkOrder = self.curWorkOrder
            //var indexPath = self.tableview.indexPathForSelectedRow() //get index of data for selected row
            //secondViewController.data = self.dataArray.objectAtIndex(indexPath.row) // get data by index and pass it to second view controller
        }else if segue.identifier == "overViewSegue"{
            print("Over view segue")
        }
    }
    
    

}
