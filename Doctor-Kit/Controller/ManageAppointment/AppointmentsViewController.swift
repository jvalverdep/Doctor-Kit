//
//  AppointmentsViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AppointmentsViewController: UIViewController {

	@IBOutlet weak var appointmentsTableView: UITableView!
	
	var appointments: [Appointment] = [Appointment(),Appointment()]
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
			appointmentsTableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "appointmentScheduledCell")
    }
	
}



extension AppointmentsViewController: UITableViewDelegate{
	
}


extension AppointmentsViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return appointments.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentScheduledCell") as! ScheduleTableViewCell
		
		return cell
	}
	
}










