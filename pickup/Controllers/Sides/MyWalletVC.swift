//
//  MyWalletVC.swift
//  pickup
//
//  Created by magdi sherif on 15/07/2023.
//

import UIKit

class MyWalletVC: UIViewController {

    //MARK: - OutLets
    @IBOutlet weak var chargeCollectionView: UICollectionView!
    @IBOutlet weak var allChargeButton: UIButton!
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var listViews: [UIView]!
    @IBOutlet weak var chargeBackView: UIView!
    
    
        
    //MARK: - vars
    var allcharge: [AllCharge] = [
        AllCharge(chargeNumber: 200, chargeDate: "12/4/2022", chargeDateTitle: "", chargeTitle: "شحن رصيد"),
        AllCharge(chargeNumber: 200, chargeDate: "12/4/2022", chargeDateTitle: "", chargeTitle: "شحن رصيد"),
        AllCharge(chargeNumber: 200, chargeDate: "12/4/2022", chargeDateTitle: "", chargeTitle: "شحن رصيد"),
        AllCharge(chargeNumber: 200, chargeDate: "12/4/2022", chargeDateTitle: "", chargeTitle: "شحن رصيد")
    ]
    
    var charge: [ChargeModel] = [
        ChargeModel(chargeNumber: 200, chargeDate: "12/4/2022", chargeDateTitle: "", chargeTitle: "شحن رصيد")
    ]
    
    var puy: [PuyModel] = [
        PuyModel(chargeNumber: 160, chargeDate: "12/4/2022", chargeDateTitle: "", chargeTitle: "دفع لطلب رقم 3422")
    ]
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configureCollectionView()

    }
    
    
    //MARK: - Actions
    @IBAction func chargeTappedButton(_ sender: UIButton) {
        
        
        for rowView in listViews {
            if rowView.tag == sender.tag {
                rowView.backgroundColor = .clear
            }
        }
        
        for rowText in titleLabels {
            if rowText.tag == sender.tag {
                rowText.textColor = .black
            }else {
                rowText.textColor = .systemGray2
            }
        }
        
    }
    
    @IBAction func allChargeButtonClick(_ sender: UIButton) {
        
    }
    
    @IBAction func chargeButtonClick(_ sender: UIButton) {
        
    }
    
    @IBAction func puyButtonClick(_ sender: UIButton) {
        
    }
    

    
    //MARK: - Functions
//    private func configureCollectionView() {
//        chargeCollectionView.register(UINib(nibName: "AllChargeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllChargeCollectionViewCell")
//        chargeCollectionView.dataSource = self
//        chargeCollectionView.delegate = self
//        
//        chargeCollectionView.register(UINib(nibName: "ChargeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChargeCollectionViewCell")
//        chargeCollectionView.dataSource = self
//        chargeCollectionView.delegate = self
//        
//        chargeCollectionView.register(UINib(nibName: "PuyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PuyCollectionViewCell")
//        chargeCollectionView.dataSource = self
//        chargeCollectionView.delegate = self
//        
//        
//    }
    
}


//extension MyWalletVC: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
