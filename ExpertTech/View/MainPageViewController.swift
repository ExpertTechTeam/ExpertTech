//
//  MainPageViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/11/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var vTitleItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let technicianIcon = UIImage(named: "icon_technician")
        let imageView = UIImageView(image: technicianIcon)
        let imageLeftBarButton = UIBarButtonItem(customView: imageView)
        self.navigationItem.leftBarButtonItem = imageLeftBarButton;
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "sectionChangeMethod:", name: "sectionChange", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sectionChangeMethod(notif: NSNotification) {
        print("Section Change")
        if let passedString: AnyObject = notif.userInfo?["title"] {
            self.vTitleItem.title = passedString as? String
            print("\(passedString)")
        }
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "sectionChange", object:nil)
    }
}
