//
//  AppointmentEditionViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AppointmentEditionViewController: UIViewController {

	
	@IBOutlet weak var patientNameLabel: UILabel!
	@IBOutlet weak var patientGenderLabel: UILabel!
	@IBOutlet weak var appointmentDateScheduledLabel: UILabel!
	
	@IBOutlet weak var weightTextField: UITextField!
	@IBOutlet weak var heightTextField: UITextField!
	@IBOutlet weak var glucoseTextField: UITextField!
	@IBOutlet weak var notesTextView: UITextView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
    

}
