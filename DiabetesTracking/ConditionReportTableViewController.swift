//
//  ConditionReportTableViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/1/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Alamofire

class ConditionReportTableViewController: UITableViewController {
    
    @IBOutlet var addConfitionReportBtn: UIBarButtonItem!
    var table_data: Array<NSDictionary> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, SERVER.BASE_URL.stringByAppendingString("conditions_reports"), parameters: ["patient_id" : LOCAL_STORAGE.userDefaults.valueForKey("patient_id")!]).responseJSON{
            response in
            if let jsonResult = response.result.value {
                self.table_data = jsonResult as! Array
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func addConditionReportAction(sender: AnyObject) {
        self.jumpByNavi("NewConditionReportTableView")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ConditionCell = tableView.dequeueReusableCellWithIdentifier("condition_report", forIndexPath: indexPath) as! ConditionCell
        let dic = self.table_data[indexPath.row]
        cell.condition_description.text! = String(dic["condition_description"]!)
        cell.date_reported.text! = String(dic["date_reported"]!)
        cell.current_treatment.text! = String(dic["current_treatment"]!)
        cell.icd10_diagnosis_code.text! = String(dic["icd10_diagnosis_code"]!)
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.table_data.count
    }
}
