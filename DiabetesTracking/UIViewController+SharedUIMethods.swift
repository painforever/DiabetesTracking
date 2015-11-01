
//
//  UIViewController+SharedUIMethods.swift
//  DiabetesTracking
//
//  Created by Yu Song on 10/30/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController: UITextFieldDelegate, UIPickerViewDelegate {
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
    
    func globallyValidateUserInputs(textFields: Array<UITextField>)->Bool {
        for textField in textFields{
            if (self.trim(textField.text!).characters.count) == 0 {
                let alert = "\(textField.placeholder) cannot be blank"
                self.showAlert(alert, message: alert)
                return false
            }
        }
        return true
    }
    
    func getEntireFormattedDateByAppendingTime(time: String) -> NSDate {
        let formater = NSDateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        var stringFromDate = formater.stringFromDate(NSDate())
        stringFromDate = stringFromDate.stringByAppendingString(time)
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formater.dateFromString(stringFromDate)!
    }
    
    func scheduleReminder(msg: String, SoundName: String, Time: String) {
        let date = self.getEntireFormattedDateByAppendingTime(Time)
        let localNotification = UILocalNotification()
        //localNotification.repeatInterval = NSW
        localNotification.alertBody = msg
        localNotification.fireDate = date
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = SoundName
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    func setLeftViewForTextfields(imageName: String, containerScale: CGFloat, imageIconScale: CGFloat, textField: UITextField) -> UIView {
        let iconImage: UIImageView = UIImageView(frame: CGRectMake(12, 12, imageIconScale, imageIconScale))
        iconImage.image = UIImage(named: imageName)
        let container : (UIView) = UIView(frame: CGRectMake(0,0, containerScale, containerScale))
        container.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        container.addSubview(iconImage)
        textField.leftViewMode = UITextFieldViewMode.Always;
        return container;
    }
    
    func getUIViewByTagFromArray(tag: Int, views: Array<UIView>) -> UIView? {
        for view in views{
            if view.tag == tag {
                return view;
            }
        }
        return nil;
    }
    
    func buildCustomPickerView(var pickerView: UIPickerView,  textField: UITextField, doneButton: UIBarButtonItem ) {
        pickerView = UIPickerView(frame: CGRectMake(0, 43, 320, 480))
        //warning, since ini Swift we must implement all the protocol methods in some protocols, like here 
        //pickerView's dataSource, we need to declare its dataSource outside.
        //pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.showsSelectionIndicator = true
        
        textField.inputView = pickerView
        
        let pickerToolBar = UIToolbar(frame: CGRectMake(0,0,320,56))
        pickerToolBar.barStyle = UIBarStyle.BlackOpaque
        pickerToolBar.sizeToFit()
        var barItems:Array<UIBarButtonItem> = [UIBarButtonItem]()
        let flexSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        barItems.append(flexSpace)
        barItems.append(doneButton)
        pickerToolBar.setItems(barItems, animated: true)
        textField.inputAccessoryView = pickerToolBar
    }
    
    func redirectTo(view: UIViewController) {
        self.navigationController?.pushViewController(view, animated: true)
    }
}
