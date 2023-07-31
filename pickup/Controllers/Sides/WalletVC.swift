//
//  WalletVC.swift
//  pickup
//
//  Created by magdi sherif on 11/07/2023.
//

import UIKit

class WalletVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var chargeCollectionView: UICollectionView!
    @IBOutlet weak var chargeSegmentController: UISegmentedControl!
    @IBOutlet weak var addButtonView: UIView!
    @IBOutlet weak var addButtonBackView: UIView!
    
    
    
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

        handleViews()
        configureCollectionView()
//        handleSegmentAction()

    }
    
    
    
    //MARK: - Actions
    @IBAction func chargeSegmentControllerAction(_ sender: Any) {
        chargeCollectionView.reloadData()
    }
    
    
    @IBAction func addButtonClick(_ sender: UIButton) {
        
    }
    
    
    
    
    //MARK: - Functions
    
    // Handle Views
    private func handleViews() {
        addButtonBackView.layer.cornerRadius = addButtonView.frame.width / 2
        addButtonView.layer.cornerRadius = addButtonView.frame.width / 2
        addButtonView.layer.borderColor = UIColor.systemBlue.cgColor
        addButtonView.layer.borderWidth = 2
    }
    
    // Configure collection view
    private func configureCollectionView() {
        
        // get only puy cell
        chargeCollectionView.register(UINib(nibName: "PuyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PuyCollectionViewCell")
        chargeCollectionView.dataSource = self
        chargeCollectionView.delegate = self
        
        // get only charge cell
        chargeCollectionView.register(UINib(nibName: "ChargeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChargeCollectionViewCell")
        chargeCollectionView.dataSource = self
        chargeCollectionView.delegate = self
        
        // get all charge cell
        chargeCollectionView.reloadData()
        chargeCollectionView.register(UINib(nibName: "AllChargeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllChargeCollectionViewCell")
        chargeCollectionView.dataSource = self
        chargeCollectionView.delegate = self

    }
    
}


extension WalletVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch chargeSegmentController.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch chargeSegmentController.selectedSegmentIndex {
        case 0:
            return puy.count
        case 1:
            return charge.count
        case 2:
            return allcharge.count
        default:
            break
        }
        
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch chargeSegmentController.selectedSegmentIndex {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PuyCollectionViewCell", for: indexPath) as! PuyCollectionViewCell
            cell.configureCell(model: puy[indexPath.row])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChargeCollectionViewCell", for: indexPath) as! ChargeCollectionViewCell
            cell.configureCell(model: charge[indexPath.row])
            return cell
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllChargeCollectionViewCell", for: indexPath) as! AllChargeCollectionViewCell
            cell.configureCell(model: allcharge[indexPath.row])
            return cell
            
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    
}


extension WalletVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch chargeSegmentController.selectedSegmentIndex {
        case 0:
            return CGSize(width: 350, height: 83)
        case 1:
            return CGSize(width: 350, height: 83)
        case 2:
            return CGSize(width: 350, height: 83)
            
        default:
            break
        }
        return CGSize()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 2, left: 2, bottom: 2, right: 2)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
