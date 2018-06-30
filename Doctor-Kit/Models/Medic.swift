//
//  Medic.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

class Medic {
	static let sharedInstance = Medic()
	private init() {} //This prevents others from using the default '()' initializer for this class.
	
	var id = 2
	var name = ""
	var lastName = ""
	var email = ""
	var profession = ""
	
	
}
