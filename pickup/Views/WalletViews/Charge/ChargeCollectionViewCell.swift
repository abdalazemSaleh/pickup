//
//  ChargeCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 15/07/2023.
//

import UIKit

class ChargeCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var chargeNumber: UILabel!
    @IBOutlet weak var chargeDate: UILabel!
    @IBOutlet weak var chargeDateTitle: UILabel!
    @IBOutlet weak var chargeTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: ChargeModel) {
        chargeNumber.text = "\(model.chargeNumber)"
        chargeDate.text = model.chargeDate
        chargeDateTitle.text = model.chargeDateTitle
        chargeTitle.text = model.chargeTitle
        
    }

}
