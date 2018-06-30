//
//  Appointment.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON
import ZCDates

class Appointment{

	var beginHour: Date
	var endHour: Date
	
	var name = ""
	var gender = ""
	var weight = ""
	var height = ""
	var glucose = ""
	var notes = ""
	
	public init(beginHour: Date, endHour: Date) {
		self.beginHour = beginHour
		self.endHour = endHour
	}
	
	public static func from(jsonAppointment: JSON) -> Appointment {
		
		return Appointment(beginHour: jsonAppointment["start"].stringValue.zGetDate()!,
									 endHour: jsonAppointment["end"].stringValue.zGetDate()!)
	}
	
	public static func from(jsonAppointments: [JSON]) -> [Appointment] {
		var appointments = [Appointment]()
		for json in jsonAppointments{
			appointments.append(Appointment.from(jsonAppointment: json))
		}
		return appointments
	}
}
