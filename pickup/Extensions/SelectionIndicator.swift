//
//  SelectionIndicator.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import Foundation
import UIKit


//MARK: - extension for down tab bar
//extension UIImage {
//    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        color.setFill()
//        UIRectFill(CGRect(x: 0, y: size.height - lineWidth, width: size.width, height: lineWidth))
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image!
//    }
//}


// MARK: - Extension for upper tab bar 
extension UIImage {
  func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(CGRect(origin: CGPoint(x: 0,y : size.height - lineHeight ), size: CGSize(width: size.width, height: lineHeight)))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
}
