//
//  LoginViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

import LocalAuthentication

class LoginViewController: UIViewController {
    
    enum LAError : Int {
        case AuthenticationFailed
        case UserCancel
        case UserFallback
        case SystemCancel
        case PasscodeNotSet
        case TouchIDNotAvailable
        case TouchIDNotEnrolled
    }
    
    @IBOutlet weak var vWhiteView: UIView!
    @IBOutlet weak var vHeaderView: UIView!
    @IBOutlet weak var vSignInBtn: UIButton!
    @IBOutlet weak var vUsernameTxtField: UITextField!
    @IBOutlet weak var vPasswordTxtField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view.
        self.vWhiteView.layer.cornerRadius = 5
        self.vHeaderView.layer.cornerRadius = 5
        self.vSignInBtn.layer.cornerRadius = 5
        self.vUsernameTxtField.layer.cornerRadius = 5
        self.vPasswordTxtField.layer.cornerRadius = 5
        self.vUsernameTxtField.leftView = UIView(frame: CGRectMake(0, 0, 10, 20))
        self.vUsernameTxtField.leftViewMode = UITextFieldViewMode.Always
        self.vPasswordTxtField.leftView = UIView(frame: CGRectMake(0, 0, 10, 20))
        self.vPasswordTxtField.leftViewMode = UITextFieldViewMode.Always
        
    }
    
    override func viewDidAppear(animated: Bool) {
 
        authenticateUser()
    }
    
    func authenticateUser() {
        let context:LAContext = LAContext();
        do {
            try context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics)
            let reason = "Scan fingerprint to login"
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {
                (success: Bool, authenticationError: NSError?) -> Void in
                
                // check whether evaluation of fingerprint was successful
                if success {
                    // fingerprint validation was successful
                    print("Fingerprint validated.")
                    
                } else {
                    // fingerprint validation failed
                    // get the reason for validation failure
                    var failureReason = "unable to authenticate user"
                    switch authenticationError!.code {
                    case LAError.AuthenticationFailed.rawValue:
                        failureReason = "authentication failed"
                    case LAError.UserCancel.rawValue:
                        failureReason = "user canceled authentication"
                    case LAError.SystemCancel.rawValue:
                        failureReason = "system canceled authentication"
                    case LAError.PasscodeNotSet.rawValue:
                        failureReason = "passcode not set"
                    case LAError.UserFallback.rawValue:
                        failureReason = "user chose password"
                    default:
                        failureReason = "unable to authenticate user"
                    }
                    print("Fingerprint validation failed: \(failureReason).");
                }
            })
        } catch {
            
        }
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
    
    @IBAction func logout(segue : UIStoryboardSegue){
        print("Logout")
    }

}
