//
//  OrdersCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import UIKit

class OrdersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var orderBackView: UIView!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var orderLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(model: orderType) {
        orderLabel.text = model.name
//        model.isSelect.toggle()

        if model.isSelect == true {
            orderLine.isHidden = false
            orderLabel.textColor = .white
        }else {
            orderLine.isHidden = true
            orderLabel.textColor = .lightText
        }
    }
    

}
