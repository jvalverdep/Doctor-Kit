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
	//    private static let baseUrl = "http://54.92.239.141:8080"
	
	public static let getDoctorSchedules = "\(baseUrl)/doctors/%@"
	public static let getPatientData = "\(baseUrl)/patients/%@"
	
}


