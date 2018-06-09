//
//  DashboardViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

	
	var doctorsDataInfo = [(title: "Total Appointments", value: 12),
												 (title: "Appointments on this week", value: 12)]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension DashboardViewController: UITableViewDelegate{
	
}



extension DashboardViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return doctorsDataInfo.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		return cell
	}
	
	
}
