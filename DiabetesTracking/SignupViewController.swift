//
//  SignupViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 10/30/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Alamofire

class SignupViewController: UIViewController {
    weak var parent: UIViewController?
    
    @IBOutlet var email: UITextField!
    @IBOutlet var first_name: UITextField!
    @IBOutlet var last_name: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var password_confirm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpButtonAction(sender: AnyObject) {
        if !self.globallyValidateUserInputs([self.email, self.first_name, self.last_name, self.password, self.password_confirm]){
            return
        }
        if self.password_confirm.text != self.password.text {
            self.showAlert("Password does not match.", message: "Password and its confirm does not match!")
            return
        }
        Alamofire.request(.GET, SERVER.BASE_URL.stringByAppendingString("users/check_email_repeat"), parameters: ["email_address": self.email.text!]).responseJSON{response in
            if String(response.result.value) == "no" {
                Alamofire.request(.POST, SERVER.BASE_URL.stringByAppendingString("users/patient_signup"), parameters: ["email_address":self.email.text!, "first_name": self.first_name.text!, "last_name":self.last_name.text!, "password": self.password.text!]).responseJSON{response in }
                self.showAlert("Sign up success!", message: "You've already signed up!")
                self.jumpByPresent("LoginViewController")
            }
            else{
                self.showAlert("Sign up failed.", message: "The email you input has already taken, please try another one!")
                return
            }
        }
    }
    @IBAction func backButtonAction(sender: AnyObject) {
        self.parent = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController")
        self.presentViewController(self.parent!, animated: true, completion: nil)
    }
    
    
}
