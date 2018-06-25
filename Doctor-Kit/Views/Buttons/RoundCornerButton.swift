//
//  RoundCornerButton.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit


class RoundCornerButton: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//
//    }
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		layer.cornerRadius = 30
		clipsToBounds = true
		self.backgroundColor = ColorUtil.hexStringToUIColor(hex: COLOR_BASE)
	}
	
}
