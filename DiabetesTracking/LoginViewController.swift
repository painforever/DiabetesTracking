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
        var uiTabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarController") as? UITabBarController
        var ddd = UIApplication.sharedApplication().delegate
        ddd?.window!?.rootViewController = uiTabBarController
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
