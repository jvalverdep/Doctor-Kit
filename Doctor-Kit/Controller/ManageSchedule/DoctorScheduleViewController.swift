//
//  DoctorScheduleViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import TableFlip
import Alamofire
import SwiftyJSON

class DoctorScheduleViewController: UIViewController {

	@IBOutlet weak var doctorScheduleTableView: UITableView!
	var doctorScheduledHours: [DoctorSchedule] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
			doctorScheduleTableView.register(UINib(nibName: "DoctorScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "doctorScheduleCell")
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		getDoctorSchedules()
	}
	
	func getDoctorSchedules() {
		Alamofire.request(String(format: HealthUpcAPI.getDoctorSchedules, "2"), method: .get, parameters: nil).responseJSON(completionHandler: { response in
			
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				if let scheduledHours = json["operation_times"].array{
					self.doctorScheduledHours = DoctorSchedule.from(jsonDoctorSchedules: scheduledHours)
					DispatchQueue.main.async {
						self.doctorScheduleTableView.reloadData()
					}
				}
			case .failure(let error):
				print(error)
			}
			
		})
	}
	
	
	@IBAction func addNewScheduleAction(_ sender: Any) {
		performSegue(withIdentifier: "addSchedule", sender: nil)
	}
	
	
}

extension DoctorScheduleViewController: UITableViewDelegate{
	
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
		let scheduleHours = doctorScheduledHours[indexPath.row]
		cell.scheduledHoursLabel.text = "\(scheduleHours.beginHour.zGetHourMinutes(scheduleHours.beginHour))Hrs - \(scheduleHours.endHour.zGetHourMinutes(scheduleHours.endHour))Hrs"
		cell.dayNameLabel.text = scheduleHours.beginHour.zDayName()
		cell.decoratorView.backgroundColor = ColorUtil.hexStringToUIColor(hex: COLOR_BASE)
		cell.selectionStyle = .none
		return cell
	}
}







