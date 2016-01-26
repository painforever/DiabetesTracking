//
//  ChangePasswordFormViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 1/25/16.
//  Copyright © 2016 EFA. All rights reserved.
//

import Foundation
import Alamofire

class ChangePasswordFormViewController : UITableViewController{
    @IBOutlet var oldPassword: UITextField!
    @IBOutlet var newPassword: UITextField!
    @IBOutlet var newPasswordConfirm: UITextField!
    @IBOutlet var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitAction(sender: AnyObject) {
        if (!self.globallyValidateUserInputs([self.oldPassword, self.newPassword, self.newPasswordConfirm])){
            return
        }
        if (self.newPasswordConfirm.text! != self.newPassword.text!){
            self.showAlert("2 passwords does not match!", message: "The 2 password need be matched!")
            return
        }
        
        Alamofire.request(.PUT, SERVER.BASE_URL.stringByAppendingString("users/update_password"), parameters: ["old_password":self.oldPassword.text!, "new_password": self.newPassword.text!, "user_id" : LOCAL_STORAGE.userDefaults.valueForKey("user_id")!]).responseJSON{
            response in
            if let jsonResult = response.result.value {
                self.showAlert("Update success", message: "Password update success!")
                self.clearAllTextFields([self.oldPassword, self.newPassword, self.newPasswordConfirm])
            }
            else {
                self.showAlert("Account error.", message: "Email or password is wrong!")
                return
            }
        }
    }
}