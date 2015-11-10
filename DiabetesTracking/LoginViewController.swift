//
//  LoginViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 10/30/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var remember_me: UISwitch!
    var signViewController:UIViewController!
    @IBAction func signupButtonAction(sender: AnyObject) {
        self.signViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SignupViewController")
        self.presentViewController(self.signViewController!, animated: true, completion: nil)
    }
    @IBAction func signinButtonAction(sender: AnyObject) {
        Alamofire.request(.POST, SERVER.BASE_URL.stringByAppendingString("sessions"), parameters: ["email":self.email.text!, "password": self.password.text!]).responseJSON{
            response in
            if let jsonResult = response.result.value {
                
                LOCAL_STORAGE.userDefaults.setValue(jsonResult.valueForKey("user_id")!, forKey: "user_id")
                LOCAL_STORAGE.userDefaults.setValue(jsonResult.valueForKey("patient_id")!, forKey: "patient_id")
                self.storeAccount()
                var uiTabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController") as? UITabBarController
                var ddd = UIApplication.sharedApplication().delegate
                ddd?.window!?.rootViewController = uiTabBarController
            }
            else {
                self.showAlert("Account error.", message: "Email or password is wrong!")
                return
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initControls()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initControls(){
        self.email.leftView = self.setLeftViewForTextfields("envelope.png", containerScale: 50, imageIconScale: 24, textField: self.email)
        self.password.leftView = self.setLeftViewForTextfields("settings.png", containerScale: 50, imageIconScale: 24, textField: self.password)
    }
    
    func storeAccount(){
        if self.remember_me.on {
            File.createFileByName(LOCAL_STORAGE.EMAIL);File.writeToFileByName(LOCAL_STORAGE.EMAIL, content: self.email.text!)
            File.createFileByName(LOCAL_STORAGE.PASSWORD);File.writeToFileByName(LOCAL_STORAGE.PASSWORD, content: (self.password.text?.sha1())!)
            let contentForUserData: String = String(format: "%d,%d", String(LOCAL_STORAGE.userDefaults.valueForKey("user_id")), String(LOCAL_STORAGE.userDefaults.valueForKey("patient_id")))
            File.writeToFileByName(LOCAL_STORAGE.USER_DATA, content: contentForUserData)
        }
    }
}
