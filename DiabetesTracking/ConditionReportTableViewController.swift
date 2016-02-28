//
//  ConditionReportTableViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/1/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit

class ConditionReportTableViewController: UITableViewController {
    
    @IBOutlet var addConfitionReportBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addConditionReportAction(sender: AnyObject) {
        self.jumpByNavi("NewConditionReportTableView")
    }
    
}
