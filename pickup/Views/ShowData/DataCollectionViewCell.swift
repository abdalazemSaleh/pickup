//
//  DataCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 13/07/2023.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet var orderViews: [UIView]!
    @IBOutlet weak var orderDetailsButtonView: UIView!
    
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderTitleToLabel: UILabel!
    @IBOutlet weak var orderTitleFromLabel: UILabel!
    @IBOutlet weak var orderTypeLabel: UILabel!
    @IBOutlet weak var ordersDataBackView: UIView!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for x in orderViews {
            x.layer.cornerRadius = x.frame.width / 2
        }
        // Initialization code
    }
    
    //MARK: - Actions
    
    @IBAction func orderDetailsButton(_ sender: UIButton) {
        
        
    }
    
    func configureCell(model: OrderTypeModel) {
        orderDateLabel.text = model.orderDate
        orderTypeLabel.text = model.orderTypeTitle
        orderTitleToLabel.text = model.orderLocationTo
        orderTitleFromLabel.text = model.orderLocationFrom
        orderDetailsButtonView = model.buttonDetailsBackView
        
    }
    
    

}
