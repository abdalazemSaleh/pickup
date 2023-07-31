//
//  CornerRaduis.swift
//  pickup
//
//  Created by magdi sherif on 09/07/2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
