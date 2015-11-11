//
//  SettingsTableViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/10/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    var loginViewController: UIViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            
        }
        else if indexPath.row == 1{
            File.deleteFileByName(LOCAL_STORAGE.EMAIL);File.deleteFileByName(LOCAL_STORAGE.PASSWORD);File.deleteFileByName(LOCAL_STORAGE.USER_DATA)
            self.loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController")
            self.presentViewController(self.loginViewController, animated: true, completion: nil)
        }
    }
}
