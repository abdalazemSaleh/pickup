//
//  EndOrdersCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 19/07/2023.
//

import UIKit

class EndOrdersCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet var endOrderViews: [UIView]!
    
    @IBOutlet weak var endOrderLocationTo: UILabel!
    @IBOutlet weak var endOrderLocationFrom: UILabel!
    @IBOutlet weak var endOrderDate: UILabel!
    @IBOutlet weak var endOrderTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        for x in endOrderViews {
            x.layer.cornerRadius = x.frame.width / 2
        }
    }
    
    func configureCell(model: EndOrders) {
        endOrderDate.text = model.endOrderDate
        endOrderTitle.text = model.endOrderTitle
        endOrderLocationFrom.text = model.endOrderLocationFrom
        endOrderLocationTo.text = model.endOrderLocationTo
    }
    

}
