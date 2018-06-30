//
//  AddNewScheduleViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import IQDropDownTextField
import CVCalendar
import Alamofire
import SwiftyJSON

class AddNewScheduleViewController: UIViewController {

	@IBOutlet weak var menuView: CVCalendarMenuView!
	@IBOutlet weak var calendarView: CVCalendarView!
	
	@IBOutlet weak var daySelectionTextField: UITextField!
	@IBOutlet weak var hoursSelectionTextField: IQDropDownTextField!

	var daySelected: Date?
	
	let keyboardToolbar: UIToolbar = UIToolbar()
	
    override func viewDidLoad() {
        super.viewDidLoad()
			
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
			
			menuView.delegate = self
			calendarView.delegate = self
			menuView.backgroundColor = ColorUtil.hexStringToUIColor(hex: COLOR_BASE)
			calendarView.backgroundColor = ColorUtil.hexStringToUIColor(hex: COLOR_BASE)
			daySelected = calendarView.manager.currentDate
			daySelectionTextField.text = calendarView.manager.currentDate.zEnglishFormat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		menuView.commitMenuViewUpdate()
		calendarView.commitCalendarViewUpdate()
	}
    

	@objc func closeAnyKeyboardOpened(){
		daySelectionTextField.resignFirstResponder()
		hoursSelectionTextField.resignFirstResponder()
	}
	
	func makeDate(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
		let calendar = Calendar(identifier: .gregorian)
		// calendar.timeZone = TimeZone(secondsFromGMT: 0)!
		let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
		return calendar.date(from: components)!
	}
	
	
	@IBAction func addNewScheduleAction(_ sender: RoundCornerButton) {
		
		guard let daySelectedValue = daySelected else {
			return
		}
		
		sender.isEnabled = false
		
		let hours = ((hoursSelectionTextField as UITextField).text!).replacingOccurrences(of: " ", with: "").split(separator: "-")
		let beginHour = "\(hours[0]):00"
		let endHour = "\(hours[1]):00"
		
		let parameters: Parameters = ["doctor_id": Int(Medic.sharedInstance.id),
																	"start": "\(daySelectedValue.zEnglishFormat()) \(beginHour)",
																	"end": "\(daySelectedValue.zEnglishFormat()) \(endHour)"]
		
		dump(parameters)
		
//		Alamofire.request(.POST, “http://myserver.com“, parameters: parameters, encoding: .JSON)
//			.responseJSON { request, response, JSON, error in
//			print(response)
//			print(JSON)
//			print(error)
//			}
		
		Alamofire.request(HealthUpcAPI.createSchedule, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
			sender.isEnabled = true
			
			print(response)
			
//			switch response.result {
//			case .success(let value):
//				let json = JSON(value)
//				if let scheduledHours = json["operation_times"].array{
//					self.doctorScheduledHours = DoctorSchedule.from(jsonDoctorSchedules: scheduledHours)
//					DispatchQueue.main.async {
//						self.doctorScheduleTableView.reloadData()
//					}
//				}
//			case .failure(let error):
//				print(error)
//			}

		})
		
		
	}
	

}

extension AddNewScheduleViewController: CVCalendarViewDelegate{
	func presentationMode() -> CalendarMode {
		return .monthView
	}
	
	func firstWeekday() -> Weekday {
		return Weekday.monday
	}
	
	func presentedDateUpdated(_ date: CVDate) {
		print(date.convertedDate()!)
		daySelected = date.convertedDate()!
		daySelectionTextField.text = "\(date.convertedDate()!.zEnglishFormat())"
	}
	
}

extension AddNewScheduleViewController: CVCalendarMenuViewDelegate{
	
	func dayOfWeekTextColor(by weekday: Weekday) -> UIColor{
		return .white
	}
	
}
