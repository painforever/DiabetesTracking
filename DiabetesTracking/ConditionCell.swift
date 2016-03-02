//
//  ConditionCell.swift
//  DiabetesTracking
//
//  Created by Yu Song on 3/1/16.
//  Copyright © 2016 EFA. All rights reserved.
//

import UIKit

class ConditionCell: UITableViewCell {

    @IBOutlet var current_treatment: UILabel!
    @IBOutlet var icd10_diagnosis_code: UILabel!
    @IBOutlet var date_reported: UILabel!
    @IBOutlet var condition_description: UILabel!
}
