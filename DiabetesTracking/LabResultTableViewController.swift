//
//  LabResultTableViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/1/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Alamofire

class LabResultTableViewController: UITableViewController {
    var newLabForm : UIViewController?
    var table_data : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, SERVER.BASE_URL.stringByAppendingString("lab_results") ,parameters: ["user_id": LOCAL_STORAGE.userDefaults.valueForKey("user_id")!]).responseJSON{
            response in
            if let jsonResult = response.result.value{
                self.table_data = jsonResult as! NSArray
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func addLabAction(sender: AnyObject) {
        self.newLabForm = self.storyboard?.instantiateViewControllerWithIdentifier("LabResultTypeTableView")
        self.navigationController?.pushViewController(self.newLabForm!, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
}
