//
//  ScheduleTableViewCell.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/24/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

	
	@IBOutlet weak var leftDecoratorView: UIView!
	@IBOutlet weak var pacientPhotoImageView: UIImageView!
	@IBOutlet weak var pacientNameLabel: UILabel!
	@IBOutlet weak var appointmentDayLabel: UILabel!
	

	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
