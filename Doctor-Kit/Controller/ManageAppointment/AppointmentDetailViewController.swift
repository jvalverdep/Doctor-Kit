//
//  AppointmentDetailViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AppointmentDetailViewController: UIViewController {

	
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = true
	}
    

	
	@IBAction func goEditAppointmentAction(_ sender: Any) {
		
		
	}
	
	
	

}
