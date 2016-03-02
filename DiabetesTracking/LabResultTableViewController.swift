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
    var table_data : [[String:AnyObject]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(LOCAL_STORAGE.userDefaults.valueForKey("patient_id")!)
        Alamofire.request(.GET, SERVER.BASE_URL.stringByAppendingString("labs") ,parameters: ["patient_id": LOCAL_STORAGE.userDefaults.valueForKey("patient_id")!]).responseJSON{
            response in
            if let jsonResult = response.result.value{
                self.table_data = jsonResult as! [[String : AnyObject]]
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
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! LabCell
        if self.table_data != nil {
            let row_data = self.table_data[indexPath.row]
            cell.test_type.text = "Type \(row_data["test_type"] ?? "")"
            cell.test_date.text = "Date: \(row_data["test_date"] ?? "")"
            cell.result.text = "Result: \(row_data["result"] ?? "")"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.table_data == nil {return 0}
        else {return self.table_data.count};
    }
}
