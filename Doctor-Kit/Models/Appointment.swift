//
//  Appointment.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON


class Appointment{

	var beginHour: Date
	var endHour: Date
	
	var name = ""
	var gender = ""
	var weight = ""
	var height = ""
	var glucotest = ""
	var notes = ""
	var reason = ""
	var patientId = 0
	
	public init(beginHour: Date, endHour: Date) {
		self.beginHour = beginHour
		self.endHour = endHour
	}
	
	
	
	public static func from(jsonAppointment: JSON) -> Appointment {
		
		
		if let appointment = jsonAppointment["appointment"].dictionary{
			if	let patientId = appointment["patient_id"]!.int,
					let reason = appointment["reason"]!.string,
					let notes = appointment["notes"]!.string,
					let schedules = appointment["dot"]?.dictionary,
					let opTimes = schedules["operation_time"]?.dictionary,
					let start = opTimes["start"]?.string,
					let end = opTimes["end"]?.string{
				
				let height = appointment["height"]!.doubleValue
				let weight = appointment["weight"]!.doubleValue
				let glucotest = appointment["glucotest"]!.doubleValue
				
				let appointmentObj = Appointment(beginHour: start.zGetDate()!,endHour: end.zGetDate()!)
				appointmentObj.patientId = patientId
				appointmentObj.reason = reason
				appointmentObj.notes = notes
				appointmentObj.height = "\(height)"
				appointmentObj.weight = "\(weight)"
				appointmentObj.glucotest = "\(glucotest)"
				
				return appointmentObj
			}
		}
		return Appointment(beginHour: Date(), endHour: Date())
	}
	
	public static func from(jsonAppointments: [JSON]) -> [Appointment] {
		var appointments = [Appointment]()
		for json in jsonAppointments{
			appointments.append(Appointment.from(jsonAppointment: json))
		}
		return appointments
	}
}
