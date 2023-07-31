//
//  OrderDataVC.swift
//  pickup
//
//  Created by magdi sherif on 20/07/2023.
//

import UIKit

protocol sendShipmentTypeProtocol: AnyObject {
    func didTappedButton(row: String)
}

class OrderDataVC: UIViewController {
    
    //MARK: - OutLets
    @IBOutlet weak var confirmOrderIcon: UIImageView!
    @IBOutlet weak var shipmentLocationIcon: UIImageView!
    @IBOutlet weak var shipmentPictureIcon: UIImageView!
    @IBOutlet var NewOrderViews: [UIView]!
    @IBOutlet weak var orderDataIcon: UIImageView!
    @IBOutlet weak var orderDataBackView: UIView!
    
    
    
    // collectionView
    @IBOutlet weak var truckTypeCollectionView: UICollectionView!
    
    // shipment type
    @IBOutlet var shipmentTypeViews: [UIView]!
    @IBOutlet var shipmentTypeCheckMark: [UIImageView]!
    @IBOutlet var shipmentTypeLabel: [UILabel]!
    
    
    // upload services
    @IBOutlet var uploadServicesViews: [UIView]!
    @IBOutlet var uploadServicesCheckMark: [UIImageView]!
    @IBOutlet var uploadServicesLabels: [UILabel]!
    
    // electric elevator
    @IBOutlet var electricElevatorViews: [UIView]!
    @IBOutlet var electricElevatorCheckMark: [UIImageView]!
    @IBOutlet var electricElevatorLabel: [UILabel]!
    

    // extra worker
    @IBOutlet var extraWorkerViews: [UIView]!
    @IBOutlet var extraWorkerCheckMark: [UIImageView]!
    @IBOutlet var extraWorkerLabel: [UILabel]!
    
    
    @IBOutlet weak var nextStepClickButton: UIButton!
    
    
    //MARK: - Vars
    var truckTypes: [OrderData] = [
        
        OrderData(truckType: "بـــيـــك أب", truckImage: UIImage(named: "truck1")!, weight: "40", distanceX: "122", sistanceY: "412", checkMark: UIImage(systemName: "checkmark.seal")!),
        OrderData(truckType: "دينة شبك", truckImage: UIImage(named: "truck2")!, weight: "40", distanceX: "122", sistanceY: "412", checkMark: UIImage(systemName: "checkmark.seal")!),
        OrderData(truckType: "دينة", truckImage: UIImage(named: "truck3")!, weight: "40", distanceX: "122", sistanceY: "412", checkMark: UIImage(systemName: "checkmark.seal")!)
        
    ]
    
    var shipmentTypeArr: [String] = ["أثاث منزلي", "اجهزة كهربائية", "مواشي وحيوانات", "مواد بناء وديكور"]
    
    var lastIndexActive: IndexPath = [1, 0]
    
    var shipmentType: Int? = nil
    var shipmentUploadServices: Int? = nil
    var electricElevator: Int? = nil
    var extraWorker: Int? = nil
    var currentItem: Int? = nil
    
    var delegate: sendShipmentTypeProtocol?
//    var row: String?
    var shipType: String? = nil
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleOrderViews()
        configureCollectionView()
        
        nextStepClickButton.isEnabled = false
//        print(currentItem ?? 404)
        
//        setupBackgroundTap()

    }
    
    //MARK: - Actions
    
    //shipment type action
    @IBAction func shipmentTypeClickButton(_ sender: UIButton) {
        
        shipmentType = sender.tag
        
        checkViews(sender: sender.self, views: shipmentTypeViews)

        checkCheckMarks(sender: sender.self, image: shipmentTypeCheckMark)
        
        checkLabels(sender: sender.self, labels: shipmentTypeLabel)
        
        checkValidation()
        
    }
    
    // upload Services click button
    @IBAction func uploadServicesClickButton(_ sender: UIButton) {
        
        shipmentUploadServices = sender.tag
        
        checkViews(sender: sender.self, views: uploadServicesViews)

        checkCheckMarks(sender: sender.self, image: uploadServicesCheckMark)
        
        checkValidation()
        
    }
    
    // electric elevator
    @IBAction func electricElevatorClickButton(_ sender: UIButton) {
        electricElevator = sender.tag
        
        checkViews(sender: sender.self, views: electricElevatorViews)
        
        checkCheckMarks(sender: sender.self, image: electricElevatorCheckMark)
        
        checkValidation()

    }
    
    // extra worker
    @IBAction func extraWorkerClickButton(_ sender: UIButton) {
        
        extraWorker = sender.tag
                
        checkViews(sender: sender.self, views: extraWorkerViews)
        
        checkCheckMarks(sender: sender.self, image: extraWorkerCheckMark)
        
        checkValidation()
        
        
    }
    
    // next step action
    @IBAction func nextStepClickButton(_ sender: UIButton) {
        
        print(currentItem ?? 404)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShipmentPhotosVC") as! ShipmentPhotosVC
//        present(vc, animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
        
        
//        sendShipmentType()
        
    }
    
    func sendShipmentType() {
//        guard row != nil else  {
//            return
//        }

    }

    
    //MARK: - Functions
    
    // handle views
    private func handleOrderViews() {
        for x in NewOrderViews {
            x.layer.cornerRadius = x.frame.width / 2
            
            x.layer.borderWidth = 0.2
            x.layer.borderColor = UIColor.white.cgColor
        }
        
        orderDataBackView.layer.cornerRadius = orderDataBackView.frame.width / 2
    }
    
    // configure cell of collection view
    private func configureCollectionView() {
        truckTypeCollectionView.delegate = self
        truckTypeCollectionView.dataSource = self
        truckTypeCollectionView.register(UINib(nibName: "TruckTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TruckTypeCollectionViewCell")
    }
    
    // check required fields
    private func checkValidation() {
        if shipmentType != nil && shipmentUploadServices != nil && electricElevator != nil && extraWorker != nil && currentItem != nil {
            
            nextStepClickButton.isEnabled = true
        }
    }
    
    // check active views
    private func checkViews(sender: UIButton, views: [UIView]) {
        views.forEach({$0.layer.borderColor = UIColor.white.cgColor})
        for rowView in views {
            if rowView.tag == sender.tag {
                rowView.layer.borderColor = UIColor.systemGreen.cgColor
                rowView.layer.borderWidth = 1
            }
        }
    }
    
    // check active check marks
    private func checkCheckMarks(sender: UIButton, image: [UIImageView]) {
        image.forEach({$0.image = UIImage(systemName: "checkmark.seal")})
        image.forEach({$0.tintColor = .darkGray})
        for rowView in image {
            if rowView.tag == sender.tag {
                rowView.image = UIImage(systemName: "checkmark.seal.fill")
                rowView.tintColor = .systemGreen
            }
        }
    }
    
    private func checkLabels(sender: UIButton, labels: [UILabel]) {
        let title = shipmentTypeArr[sender.tag]
        delegate?.didTappedButton(row: title)
        
//        labels.forEach({$0.text!})
        for rowLabel in labels {
            rowLabel.tag = sender.tag
            shipType = rowLabel.text
//            print(shipType!)

//            shipType = rowLabel.text!
            print(shipType)
//            guard row != nil else {return}
//            delegate?.didTappedButton(rowLabel.text!)
//            print(delegate?.didTappedButton(rowLabel.text!) ?? "nnnn")
//            rowLabel.text = delegate?.didTappedButton(row!)
        }
    }
    
    func sendTruckUsingClosure(shipmentType: String) {

    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyPoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyPoard() {
        view.endEditing(false)
    }
    

}


//MARK: - Extensions

extension OrderDataVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.lastIndexActive != indexPath {
            
            let cell = collectionView.cellForItem(at: indexPath) as! TruckTypeCollectionViewCell
            
            cell.checkMarkImage.image = UIImage(systemName: "checkmark.seal.fill")
            cell.truckTypebackView.layer.borderColor = UIColor.systemGreen.cgColor
            cell.truckTypebackView.layer.borderWidth = 1
            
            
            let cell2 = collectionView.cellForItem(at: self.lastIndexActive) as? TruckTypeCollectionViewCell
            cell2?.checkMarkImage.image = UIImage(systemName: "checkmark.seal")
            cell2?.truckTypebackView.layer.borderColor = UIColor.white.cgColor
            cell2?.truckTypebackView.layer.borderWidth = 1
            self.lastIndexActive = indexPath
        }
        
        let index = truckTypes[indexPath.row]
        print(index)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        truckTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TruckTypeCollectionViewCell", for: indexPath) as! TruckTypeCollectionViewCell
        cell.configureCell(model: truckTypes[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        for cell in truckTypeCollectionView.visibleCells {
            if let row = truckTypeCollectionView.indexPath(for: cell)?.item {
                currentItem = row
                checkValidation()
            }
        }
    }
    
    
}

extension OrderDataVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 219, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
