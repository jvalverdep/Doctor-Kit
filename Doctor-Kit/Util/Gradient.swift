//
//  Gradient.swift
//  Doctor-Kit
//
//  Created by zcrome on 6/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//
import UIKit

class Gradient{
	
	static func applyGradientTo(View view: UIView, withColors colors: [Any], withStartPoint startPoint: CGPoint, andEndPoint endPoint: CGPoint){
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = view.bounds
		gradientLayer.colors = colors
		gradientLayer.startPoint = startPoint
		gradientLayer.endPoint = endPoint
		gradientLayer.locations = [0.0,0.9]
		view.layer.addSublayer(gradientLayer)
	}
	
}
