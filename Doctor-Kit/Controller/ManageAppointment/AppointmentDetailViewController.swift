//
//  AppointmentDetailViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AppointmentDetailViewController: UIViewController {

	
	@IBOutlet weak var patientPhotoImageView: UIImageView!
	@IBOutlet weak var patientNameLabel: UILabel!
	@IBOutlet weak var patientGenderLabel: UILabel!
	@IBOutlet weak var appointmentDayLabel: UILabel!
	@IBOutlet weak var appointmentHoursLabel: UILabel!
	
	@IBOutlet weak var patientWeightLabel: UILabel!
	@IBOutlet weak var patientHeightLabel: UILabel!
	@IBOutlet weak var patientGlucoseLabel: UILabel!
	
	@IBOutlet weak var patientNotesTextView: UITextView!
	
	
	var appointment: Appointment!
	
    override func viewDidLoad() {
        super.viewDidLoad()
			setup(with: appointment)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = true
	}
	
	
	fileprivate func setup(with appointment: Appointment){
//		patientNameLabel.text = appointment.name
//		patientGenderLabel.text = appointment.gender
//		appointmentDayLabel.text = appointment.beginHour.zDayAndMonth()
//		
//		
//		
//		appointmentHoursLabel.text = "\(appointment.beginHour.zGetHourMinutes(appointment.beginHour)) - \(appointment.endHour.zGetHourMinutes(appointment.endHour))"
//		patientWeightLabel.text = (appointment.weight.isEmpty ? "Empty" : appointment.weight)
//		patientHeightLabel.text = (appointment.height.isEmpty ? "Empty" : appointment.height)
//		patientGlucoseLabel.text = (appointment.glucose.isEmpty ? "Empty" : appointment.glucose)
//		patientNotesTextView.text = (appointment.notes.isEmpty ? "Empty" : appointment.notes)
	}

	
	@IBAction func goEditAppointmentAction(_ sender: Any) {
		performSegue(withIdentifier: "editAppointment", sender: nil)
		
	}
	
	
	

}
