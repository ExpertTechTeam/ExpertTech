//
//  DetailWorkOrderViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/2/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class DetailWorkOrderViewController: UIViewController, UISplitViewControllerDelegate{
    @IBOutlet weak var vToolbar: UIToolbar!
    @IBOutlet weak var vTimeCount:UILabel!
    @IBOutlet weak var vStartButton:StartDoneWorkOrderButton!
    var hideMaster:Bool = false
    var startTime = NSTimeInterval()
    var timer:NSTimer = NSTimer()
    var duration:NSDecimalNumber!
    var strMinutes:String!
    var strSeconds:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vTimeCount.hidden = true
        // Do any additional setup after loading the view.
        vToolbar.frame = CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 100)
        vToolbar.sizeToFit()
        print("load")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTouchUpButton(){
        if vStartButton.titleLabel?.text == "Start"{
            vStartButton.onTouchUpStart()
        }else{
            vStartButton.onTouchUpDone()
        }
    }
    @IBAction func onTouchDownButton(sender :AnyObject!){
        if vStartButton.titleLabel?.text == "Start"{
            vStartButton.onTouchDownStart()
        }else{
            vStartButton.onTouchDownDone()
            performSegueWithIdentifier("technicalReportSegue", sender: sender)
        }
    }
    

    func splitViewController(svc: UISplitViewController, shouldHideViewController vc: UIViewController, inOrientation orientation: UIInterfaceOrientation) -> Bool {
        return hideMaster
    }
    
    
    @IBAction func startWork(){
        print("start")
        hideMaster = !hideMaster;
        let animations: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .PrimaryHidden
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
            
        }
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations) { (Bool) -> Void in
        }/*
        let animations1: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .Automatic
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
            
        }
        UIView.animateWithDuration(0.3, delay: 4, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations1) { (Bool) -> Void in
        }
        */
    }
    
    /*
    @IBAction func startWork() {
        self.startCount()
        self.vTimeCount.hidden = false
        self.vStartButton.hidden = true
        self.hideMaster = !self.hideMaster
        let spv:UISplitViewController = self.splitViewController!
        spv.view.setNeedsLayout()
        spv.delegate = nil;
        spv.delegate = self;
    //  spv.willRotateToInterfaceOrientation(self.interfaceOrientation, duration: 2000)
    }
    @IBAction func stopWork(sender:AnyObject?){
        self.stopCount()
    
    }
    
    func startCount(){
        if (!timer.valid) {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        }
    }
    
    func stopCount(){
        timer.invalidate()
        duration = NSDecimalNumber(string: "\(strMinutes).\(strSeconds)")
        print("Duration : \(duration)")
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        //add the leading zero for minutes, seconds and store them as string constants
        strMinutes = String(format: "%02d", minutes)
        strSeconds = String(format: "%02d", seconds)
        //concatenate minuets, seconds as assign it to the UILabel
        vTimeCount.text = "\(strMinutes):\(strSeconds)"
    }*/
        
    
    
    @IBAction func cancelFromTechnicalReport(segue:UIStoryboardSegue){
        vStartButton.onTouchUpDone()
    }
    
    @IBAction func completeWorkOrder(segue:UIStoryboardSegue){
        
        print("Back")
        hideMaster = !hideMaster;
        let animations1: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .PrimaryHidden
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
        }
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations1) { (Bool) -> Void in
            
            self.splitViewController?.preferredDisplayMode = .Automatic
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
        }
        /*
        let animations2: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .PrimaryHidden
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
            
        }
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations2) { (Bool) -> Void in
        }
        let animations3: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .Automatic
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
            
        }
        UIView.animateWithDuration(0.3, delay: 4, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations3) { (Bool) -> Void in
        }
        */
        
        
        vStartButton.layer.borderWidth = 1.0;
        vStartButton.layer.cornerRadius = 4.0;
        vStartButton.layer.borderColor = UIColor(hex: 0x0168A2).CGColor
        vStartButton.setTitleColor(UIColor(hex: 0x0168A2), forState: UIControlState.Normal)
        vStartButton.setTitle("Start", forState: UIControlState.Normal)
        vStartButton.layer.backgroundColor = UIColor.whiteColor().CGColor

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
