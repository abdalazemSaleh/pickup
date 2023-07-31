//
//  OffersCollectionViewCell.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var offerBackView: UIView!
    @IBOutlet weak var offerDescriptionLabel: UILabel!
    @IBOutlet weak var offerTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        offerBackView.addLayer()
        configView()
    }
    
    private func configView() {
        self.clipsToBounds = false
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 13
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
    }
    

}
