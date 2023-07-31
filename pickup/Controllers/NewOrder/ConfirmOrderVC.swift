//
//  ConfirmOrderVC.swift
//  pickup
//
//  Created by magdi sherif on 27/07/2023.
//

import UIKit

class ConfirmOrderVC: UIViewController {
    

    //MARK: - OutLets
    @IBOutlet var confirmOrderViews: [UIView]!
    @IBOutlet var scrollViews: [UIView]!
    
    // truck type
    @IBOutlet weak var truckTypeName: UILabel!
    @IBOutlet weak var truckTypeImageView: UIImageView!
    @IBOutlet weak var truckTypeBackView: UIView!
    
    // shipment Type
    @IBOutlet weak var shupmentTypeLabel: UILabel!
    
    //MARK: - Vars
    
    var shipmentType = OrderDataVC()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        handleViews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shupmentTypeLabel.text = shipmentType.shipType

    }
//    override func viewDidAppear(_ animated: Bool) {
//        shupmentTypeLabel.text = shipmentType.shipType
//
//    }
    
    //MARK: - Actions
    
    
    //MARK: - Functions
    private func handleViews() {
        for x in confirmOrderViews {
            x.layer.cornerRadius = x.frame.width / 2
        }
        
        for y in scrollViews {
            y.layer.cornerRadius = y.frame.width / 2
        }
    }
    

}

//extension ConfirmOrderVC: sendShipmentTypeProtocol {
//    func didTappedButton(row: String) {
//        shipmentType.delegate = self
//        shupmentTypeLabel.text = row
//    }
//
//
//
//
//
//}
