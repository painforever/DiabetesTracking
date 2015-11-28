//
//  NewMedicationTableView.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/14/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Alamofire

class NewMedicationTableView: UITableViewController {

    @IBOutlet var drug_name: UITextField!
    @IBOutlet var start_date: UITextField!
    @IBOutlet var end_date: UITextField!
    @IBOutlet var route_name: UITextField!
    @IBOutlet var dosage: UITextField!
    @IBOutlet var addBubtton: UIButton!
    
    @IBAction func addButtonAction(sender: AnyObject) {
        if !self.globallyValidateUserInputs([self.drug_name, self.start_date, self.end_date, self.dosage, self.route_name]){
            return
        }
        Alamofire.request(.POST, SERVER.BASE_URL.stringByAppendingString("rxs"), parameters: ["prm": ["patient_id": LOCAL_STORAGE.userDefaults.valueForKey("patient_id")!, "date_reported": self.start_date.text!, "end_date": self.end_date.text!, "dosage": self.dosage.text!, "route_name": self.route_name.text!]]).responseJSON{
            response in
            if response.response?.statusCode == 200{
                if let jsonResult = response.result.value {
                    self.showAlert("Create success!", message: "New medication "+self.drug_name.text!+" created success!")
                }
            }
            else{
                print("Failed to add drug, error: \(response.result.error?.description)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
