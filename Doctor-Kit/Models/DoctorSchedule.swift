//
//  DoctorSchedule.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/30/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON


class DoctorSchedule{
	
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
	
	public static func from(jsonDoctorSchedule: JSON) -> DoctorSchedule {
		
		return DoctorSchedule(beginHour: jsonDoctorSchedule["start"].stringValue.zGetDate()!,
											 endHour: jsonDoctorSchedule["end"].stringValue.zGetDate()!)
	}
	
	public static func from(jsonDoctorSchedules: [JSON]) -> [DoctorSchedule] {
		var doctorSchedules = [DoctorSchedule]()
		for json in jsonDoctorSchedules{
			doctorSchedules.append(DoctorSchedule.from(jsonDoctorSchedule: json))
		}
		return doctorSchedules
	}
}
