//
//  DoctorScheduleViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import TableFlip

class DoctorScheduleViewController: UIViewController {

	@IBOutlet weak var doctorScheduleTableView: UITableView!
	var doctorScheduledHours = ["",""]
	
    override func viewDidLoad() {
        super.viewDidLoad()
			doctorScheduleTableView.register(UINib(nibName: "DoctorScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "doctorScheduleCell")
    }
	
	
}

extension DoctorScheduleViewController: UITableViewDelegate{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "addSchedule", sender: nil)
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
}

extension DoctorScheduleViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return doctorScheduledHours.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "doctorScheduleCell") as! DoctorScheduleTableViewCell
		return cell
	}
}







