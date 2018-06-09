//
//  LoginViewController.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	override func performSegue(withIdentifier identifier: String, sender: Any?) {
		if identifier == "goHome"{
			
			let homeViewController = UIStoryboard(name: "Home.storyboard", bundle: nil).instantiateInitialViewController()
			self.present(homeViewController!, animated: true, completion: nil)
		}
	}
	
	
	@IBAction func signInAction(_ sender: RoundCornerButton) {
		performSegue(withIdentifier: "goHome", sender: nil)
	}
	


}
