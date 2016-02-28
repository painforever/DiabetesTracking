//
//  NewConditionReportTableView.swift
//  DiabetesTracking
//
//  Created by Yu Song on 2/28/16.
//  Copyright © 2016 EFA. All rights reserved.
//

import UIKit
import Alamofire

class NewConditionReportTableView: UITableViewController {
    @IBOutlet var submitBtn: UIButton!
    @IBOutlet var blurred_vision: UISwitch!
    @IBOutlet var dry_itchy_skin: UISwitch!
    @IBOutlet var extreme_hunger: UISwitch!
    @IBOutlet var fatigue: UISwitch!
    @IBOutlet var nausea: UISwitch!
    @IBOutlet var poorly_healing_wounds: UISwitch!
    @IBOutlet var thirst: UISwitch!
    @IBOutlet var tingling_in_the_feet: UISwitch!
    @IBOutlet var urinating: UISwitch!
    @IBOutlet var weight_loss: UISwitch!
    @IBOutlet var yeast_infections: UISwitch!
    
    
    @IBOutlet var blurred_vision_label: UILabel!
    @IBOutlet var dry_itchy_skin_label: UILabel!
    @IBOutlet var extreme_hunger_label: UILabel!
    @IBOutlet var fatigue_label: UILabel!
    @IBOutlet var nausea_label: UILabel!
    @IBOutlet var poorly_healing_wounds_label: UILabel!
    @IBOutlet var thirst_label: UILabel!
    @IBOutlet var tingling_in_the_feet_label: UILabel!
    @IBOutlet var urinating_label: UILabel!
    @IBOutlet var weight_loss_label: UILabel!
    @IBOutlet var yeast_infections_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitAction(sender: AnyObject) {
        Alamofire.request(.POST, SERVER.BASE_URL.stringByAppendingString("conditions_reports"), parameters: ["patient_id" : LOCAL_STORAGE.userDefaults.valueForKey("patient_id")!, "conditions_report" : ["date_reported": NSDate(), "condition_description": self.jsonSwitcherArray([self.blurred_vision, self.dry_itchy_skin, self.extreme_hunger, self.fatigue, self.nausea, self.poorly_healing_wounds, self.thirst, self.tingling_in_the_feet, self.urinating, self.weight_loss, self.yeast_infections], labels:[self.blurred_vision_label, self.dry_itchy_skin_label, self.extreme_hunger_label, self.fatigue_label, self.nausea_label, self.poorly_healing_wounds_label, self.thirst_label, self.tingling_in_the_feet_label, self.urinating_label, self.weight_loss_label, self.yeast_infections_label] )]]).responseJSON{
            response in
        }
    }
}
