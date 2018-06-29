//
//  DoctorScheduleTableViewCell.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class DoctorScheduleTableViewCell: UITableViewCell {

	
	@IBOutlet weak var decoratorView: UIView!
	@IBOutlet weak var dayNameLabel: UILabel!
	@IBOutlet weak var scheduledHoursLabel: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
    
}
