//
//  MedicationsTableViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/1/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Alamofire

class MedicationsTableViewController: UITableViewController {
    
    var table_data: Array<AnyObject> = [];
    var newMedForm: NewMedicationTableView?;
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, SERVER.BASE_URL.stringByAppendingString("rxs"), parameters: ["patient_id":LOCAL_STORAGE.userDefaults.valueForKey("patient_id")!]).responseJSON{response in
            if let jsonResult = response.result.value {
                self.table_data = jsonResult as! Array
                self.tableView.reloadData()
                print(jsonResult)
            }
        }
    }
    @IBAction func addMedicationButtonAction(sender: AnyObject) {
        self.newMedForm = self.storyboard?.instantiateViewControllerWithIdentifier("NewMedicationTableView") as! NewMedicationTableView
        self.navigationController?.pushViewController(self.newMedForm!, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: MedCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MedCell
        let dic = self.table_data[indexPath.row]
        cell.drug_name.text = String(dic["drug_name"])
        cell.start_date.text = String(dic["prescribed_date"])
        cell.end_date.text = String(dic["end_date"])
        cell.route_name.text = String(dic["route_name"])
        cell.dosage.text = String(dic["dosage"])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.table_data.count
    }
}
