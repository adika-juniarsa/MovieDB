//
//  UIView+Style.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation
import UIKit

extension UIView {
    
    func addBottomShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.14).cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: bounds.width,
                                                     height: layer.shadowRadius)).cgPath
    }
    
    func applyShadow(color: UIColor, alpha: Float, radius: CGFloat, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.setRadius(radius)
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / UIScreen.main.scale
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func setRadius(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func applyShadow() {
        self.applyShadow(color: UIColor().hexStringToUIColor(hex: "#424242"), alpha: 0.15, radius: 5, x: 0, y: 1, blur: 10, spread: 0)
    }
}
