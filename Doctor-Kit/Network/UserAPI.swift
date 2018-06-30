//
//  UserAPI.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

class UserAPI {
	private static let baseUrl = "https://randomuser.me/api/"
	public static let getUsers = "\(baseUrl)?results=%@"
}
