//
//  ShadowView.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import Foundation
import UIKit

class CardView: UIView {
    
    //    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowOffsetWidth: CGFloat = 2
    @IBInspectable var shadowOffsetHeight: CGFloat = 2
    @IBInspectable var shadowOpacity: CGFloat = 0.5
    @IBInspectable var shadowColor: UIColor = .gray
//    @IBInspectable var borderWidth: CGFloat = 0
//    @IBInspectable var borderColor: UIColor?
    
    override func layoutSubviews() {
        //        layer.cornerRadius = cornerRadius
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowColor = shadowColor.cgColor
//        layer.borderWidth = borderWidth
//        layer.borderColor = borderColor? .cgColor
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
    }
}



extension UIView{
    
    //func addLayerProbirties(view: UIView){
    //    view.layer.cornerRadius = 7
    //    view.layer.shadowColor = UIColor.black.cgColor
    //    view.layer.shadowOffset = CGSize(width: 2, height: 3)
    //    let shadowPath = UIBezierPath(roundedRect:view.bounds , cornerRadius: 10)
    //    view.layer.shadowPath = shadowPath.cgPath
    //    view.layer.shadowOpacity = 0.3
    //
    //}

    func addLayer( cornerradius: CGFloat = 10, shadowColor: UIColor = UIColor.systemGray, shadowOffsetWidth: CGFloat = 20, shadowOffsetHeight: CGFloat = 20, shadowOpacity: CGFloat = 1){
        self.layer.cornerRadius = cornerradius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect:self.bounds , cornerRadius: cornerradius)
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowOpacity = Float(shadowOpacity)
        
    }
}

extension UIView {
    func addBorder(borderWidth: CGFloat = 0.3, borderColor: UIColor = UIColor.darkGray) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

