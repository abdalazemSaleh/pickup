//
//  TruckTypeCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 23/07/2023.
//

import UIKit

class TruckTypeCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var truckTypebackView: UIView!
    @IBOutlet weak var checkMarkImage: UIImageView!
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var distanceYlabel: UILabel!
    @IBOutlet weak var distanceXLabel: UILabel!
    @IBOutlet weak var weightImage: UIImageView!
    @IBOutlet weak var distanceImage: UIImageView!
    @IBOutlet weak var truckImageView: UIImageView!
    @IBOutlet weak var truckTypeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        handleViews()
        
//        delegate?.truckType(truckImage: truckImageView.image!, truckName: truckTypeLabel.text!)
    }
    
    func configureCell(model: OrderData) {
        checkMarkImage.image = model.checkMark
        weightNumberLabel.text = model.weight
        distanceXLabel.text = model.distanceX
        distanceYlabel.text = model.sistanceY
        truckTypeLabel.text = model.truckType
        truckImageView.image = model.truckImage
    }
    
    func handleViews() {
        checkMarkImage.layer.cornerRadius = checkMarkImage.frame.width / 2
//        distanceImage.layer.cornerRadius = distanceImage.frame.width / 2
//        weightImage.layer.cornerRadius = weightImage.frame.width / 2
    }

}
