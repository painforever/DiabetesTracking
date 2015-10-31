
//
//  UIViewController+SharedUIMethods.swift
//  DiabetesTracking
//
//  Created by Yu Song on 10/30/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func trim(str: String) -> String {
        return str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func isNumber(input: String) -> Bool {
        if let _ = Int(input){
            return true
        }
        else{
            return false
        }
    }
    
    func clearAllTextFields(textFields: Array<UITextField>){
        for textField in textFields {
            textField.text = ""
        }
    }
}
