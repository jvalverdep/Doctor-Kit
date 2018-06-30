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
			
			getAppointments()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = false
	}
	
	
	

	func getAppointments() {
		Alamofire.request(String(format: HealthUpcAPI.getDoctorAppointments, "2"), method: .get, parameters: nil).responseJSON(completionHandler: { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				if let appointments = json["operation_times"].array{
					self.appointments = Appointment.from(jsonAppointments: appointments)
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



extension AppointmentsViewController: UITableViewDelegate{

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
		performSegue(withIdentifier: "goAppointmentDetail", sender: nil)
	}
	
}


extension AppointmentsViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return appointments.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentScheduledCell") as! ScheduleTableViewCell
		
		cell.appointmentDayLabel.text = "scheduled: \(appointments[indexPath.row].beginHour.zEnglishFormat())"
		
		return cell
	}
}










