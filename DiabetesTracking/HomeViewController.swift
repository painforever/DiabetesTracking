//
//  HomeViewController.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/1/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labResultsImage: UIImageView!
    @IBOutlet weak var conditionReportImage: UIImageView!
    
    @IBOutlet weak var diagnosisImage: UIImageView!
    @IBOutlet weak var dietReportImage: UIImageView!
    @IBOutlet weak var treatmentImage: UIImageView!
    @IBOutlet weak var medicationsImage: UIImageView!
    
    var tapLabResult : UITapGestureRecognizer!
    var tapConditionReport : UITapGestureRecognizer!
    var tapDiagnosis : UITapGestureRecognizer!
    var tapdietReport : UITapGestureRecognizer!
    var tapTreatment : UITapGestureRecognizer!
    var tapMedications : UITapGestureRecognizer!
    
    var labResultView : UIViewController?
    var conditionReportView: UIViewController?
    var dietReportView : UIViewController?
    var diagnosisView : UIViewController?
    var treatmentView : UIViewController?
    var medicationsView : UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initControls()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func initControls() {
        self.title = "Home";
        self.tapLabResult = UITapGestureRecognizer(target: self, action: Selector("tapLabResultsAction"))
        self.tapConditionReport = UITapGestureRecognizer(target: self, action: Selector("tapConditionReportAction"))
        self.tapDiagnosis = UITapGestureRecognizer(target: self, action: Selector("tapDiagnosisAction"))
        self.tapdietReport = UITapGestureRecognizer(target: self, action: Selector("tapDietReportAction"))
        self.tapTreatment = UITapGestureRecognizer(target: self, action: Selector("tapTreatmentAction"))
        self.tapMedications = UITapGestureRecognizer(target: self, action: Selector("tapMedicationsAction"))
        
        let gestures : Array<UITapGestureRecognizer> = [self.tapLabResult, self.tapConditionReport, self.tapDiagnosis, self.tapdietReport, self.tapTreatment, self.tapMedications]
        let imageViews : Array<UIImageView> = [self.labResultsImage, self.conditionReportImage, self.diagnosisImage, self.dietReportImage, self.treatmentImage, self.medicationsImage]

        for i in 0..<gestures.count{
            let imageView : UIImageView = imageViews[i]
            let gesture : UITapGestureRecognizer = gestures[i]
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(gesture)
        }
    }
    
    //all tap actions as belows
    func tapLabResultsAction() {
        print("tap!!!!!!")
        self.labResultView = self.storyboard?.instantiateViewControllerWithIdentifier("LabResultTableViewController")
        self.redirectTo(self.labResultView!)
    }
    func tapConditionReportAction(){
        self.conditionReportView = self.storyboard?.instantiateViewControllerWithIdentifier("ConditionReportTableViewController")
        self.redirectTo(self.conditionReportView!)
    }
    func tapDiagnosisAction(){
        self.diagnosisView = self.storyboard?.instantiateViewControllerWithIdentifier("DietReportTableViewController")
        self.redirectTo(self.diagnosisView!)
    }
    func tapDietReportAction(){
        self.dietReportView = self.storyboard?.instantiateViewControllerWithIdentifier("DiagnosisTableViewController")
        self.redirectTo(self.dietReportView!)
    }
    func tapTreatmentAction(){
        self.treatmentView = self.storyboard?.instantiateViewControllerWithIdentifier("TreatmentTableViewController")
        self.redirectTo(self.treatmentView!)
    }
    func tapMedicationsAction(){
        self.medicationsView = self.storyboard?.instantiateViewControllerWithIdentifier("MedicationsTableViewController")
        self.redirectTo(self.medicationsView!)
    }
}
