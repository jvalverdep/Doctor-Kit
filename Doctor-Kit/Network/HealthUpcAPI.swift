//
//  HealthUpcAPI.swift
//  Patient-Kit
//
//  Created by zcrome on 5/25/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation


class HealthUpcAPI {
	private static let baseUrl = "http://localhost:8080"
//	    private static let baseUrl = "http://35.173.213.117:8080"
	
	public static let getDoctorSchedules = "\(baseUrl)/doctors/%@"
	public static let createSchedule = "\(baseUrl)/doctors/work_hours"
	public static let getDoctorAppointments = "\(baseUrl)/doctors/%@/appointments"
	public static let getPatient = "\(baseUrl)/patients/%@"
}


