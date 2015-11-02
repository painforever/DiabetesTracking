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
            if let JSON = response.result.value {
                var result = JSON.valueForKey("result")
                print("JSON: \(result!)")
            }
        }
//        var uiTabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController") as? UITabBarController
//        var ddd = UIApplication.sharedApplication().delegate
//        ddd?.window!?.rootViewController = uiTabBarController
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
