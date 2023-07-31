//
//  WalletCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 15/07/2023.
//

import UIKit

class AllChargeCollectionViewCell: UICollectionViewCell {

    
    //MARK: - Outlets
    
    @IBOutlet weak var chargeNumberLabel: UILabel!
    @IBOutlet weak var chargeDateLabel: UILabel!
    @IBOutlet weak var chargeDateTitleLabel: UILabel!
    @IBOutlet weak var chargeTitleLabel: UILabel!
    @IBOutlet weak var allChargeBackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: AllCharge) {
        chargeNumberLabel.text = "\(model.chargeNumber)"
        chargeDateLabel.text = model.chargeDate
        chargeDateTitleLabel.text = model.chargeDateTitle
        chargeTitleLabel.text = model.chargeTitle
    }
    
    
    

}
