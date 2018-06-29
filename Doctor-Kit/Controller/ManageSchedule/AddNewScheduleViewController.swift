//
//  AddNewScheduleViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import IQDropDownTextField


class AddNewScheduleViewController: UIViewController {

	@IBOutlet weak var daySelectionTextField: IQDropDownTextField!
	@IBOutlet weak var hoursSelectionTextField: IQDropDownTextField!
	
	
	
	let keyboardToolbar: UIToolbar = UIToolbar()
	
    override func viewDidLoad() {
        super.viewDidLoad()

			daySelectionTextField.isOptionalDropDown = false
			daySelectionTextField.itemList = DOCTOR_SCHEDULED_DAYS
			
			hoursSelectionTextField.isOptionalDropDown = false
			hoursSelectionTextField.itemList = DOCTOR_SCHEDULED_HOURS
			
			
			keyboardToolbar.barStyle = UIBarStyle.default
			keyboardToolbar.items=[
				UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
				UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
				UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.plain, target: self, action: #selector(closeAnyKeyboardOpened))
			]
			keyboardToolbar.sizeToFit()
			daySelectionTextField.inputAccessoryView = keyboardToolbar
			hoursSelectionTextField.inputAccessoryView = keyboardToolbar
			
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	@objc func closeAnyKeyboardOpened(){
		daySelectionTextField.resignFirstResponder()
		hoursSelectionTextField.resignFirstResponder()
	}
	
	
	
	
	
	

}
