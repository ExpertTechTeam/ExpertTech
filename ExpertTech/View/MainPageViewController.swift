//
//  MainPageViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/11/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let technicianIcon = UIImage(named: "icon_technician")
        let imageView = UIImageView(image: technicianIcon)
        let imageLeftBarButton = UIBarButtonItem(customView: imageView)
        
        self.navigationItem.leftBarButtonItem = imageLeftBarButton;
        /*
        let technicianImg: UIImage = UIImage(named: "icon_technician")!
        technicianImg.drawInRect(CGRectMake(0, 0, 22, 22))
        vTechniicianImg.image=technicianImg*/
        // Do any additional setup after loading the view.
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
