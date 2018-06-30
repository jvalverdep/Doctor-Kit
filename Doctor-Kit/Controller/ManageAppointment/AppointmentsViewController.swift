//
//  AppointmentsViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class AppointmentsViewController: UIViewController {
	
	@IBOutlet weak var appointmentsTableView: UITableView!
	var appointments: [Appointment] = []
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		appointmentsTableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "appointmentScheduledCell")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = false
		self.appointmentsTableView.reloadData()
		getAppointments()
	}
	
	func getAppointments() {
		
		let doctorId = Medic.sharedInstance.id
		
		Alamofire.request(String(format: HealthUpcAPI.getDoctorAppointments, "\(doctorId)"), method: .get, parameters: nil).responseJSON(completionHandler: { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				if let appointments = json.array{
					self.appointments = Appointment.from(jsonAppointments: appointments)
					self.getPatientDataAndAppend(to: self.appointments)
				}
			case .failure(let error):
				print(error)
			}
		})
	}
	
	func getPatientDataAndAppend(to appointments: [Appointment]){
		
		self.appointments.removeAll()
		
		for appointment in appointments{
			Alamofire.request(String(format: HealthUpcAPI.getPatient, "\(appointment.patientId)"), method: .get, parameters: nil).responseJSON(completionHandler: { response in
				switch response.result {
				case .success(let value):
					let json = JSON(value)
					
					if let name = json["first_name"].string,
							let lastName = json["last_name"].string,
							let medicalRecord = json["medical_record"].dictionary,
							let height = medicalRecord["height"]?.string,
							let weight = medicalRecord["weight"]?.string,
							let notes = medicalRecord["notes"]?.string{
						appointment.weight = weight
						appointment.height = height
						appointment.notes = notes
						appointment.name = "\(name) \(lastName)"
						self.appointments.append(appointment)
						DispatchQueue.main.async {
							self.appointmentsTableView.reloadData()
						}
					}
				case .failure(let error):
					print(error)
				}
			})
		}
	}
	
	
	
	override func performSegue(withIdentifier identifier: String, sender: Any?) {
		if identifier == "goAppointmentDetail", let appointment = sender as? Appointment{
			let appointmentDetailVC = storyboard?.instantiateViewController(withIdentifier: "appointmentDetail") as! AppointmentDetailViewController
			appointmentDetailVC.appointment = appointment
			self.navigationController?.pushViewController(appointmentDetailVC, animated: true)
		}
	}
	
}

extension AppointmentsViewController: UITableViewDelegate{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
		
		dump(appointments)
		
		print(indexPath.row)
		
		performSegue(withIdentifier: "goAppointmentDetail", sender: appointments[indexPath.row])
	}
}

extension AppointmentsViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return appointments.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentScheduledCell") as! ScheduleTableViewCell
		cell.appointmentDayLabel.text = "scheduled: \(appointments[indexPath.row].beginHour.zEnglishFormat())"
		cell.leftDecoratorView.backgroundColor = ColorUtil.hexStringToUIColor(hex: COLOR_BASE)
		cell.pacientNameLabel.text = appointments[indexPath.row].name
		cell.selectionStyle = .none
		
		return cell
	}
}










