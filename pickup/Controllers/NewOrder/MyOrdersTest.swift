//
//  MyOrdersTest.swift
//  pickup
//
//  Created by magdi sherif on 23/07/2023.
//

import UIKit

class MyOrdersTest: UIViewController {

    //MARK: - OutLets
    @IBOutlet weak var ordersCollectionView: UICollectionView!
    @IBOutlet var orderLabels: [UILabel]!
    @IBOutlet var orderViews: [UIView]!
    @IBOutlet var orderInspectorViews: [UIView]!
    
    //MARK: - Vars
    var orderData: [OrderTypeModel] = [
        OrderTypeModel(orderTypeTitle: "توصيل أغراضك", orderLocationFrom: "من شارع الملك فهد ", orderLocationTo: "الي شارع الملك عبد العزيز ", orderDate: "2023/12/3", buttonDetailsBackView: UIView()),
        OrderTypeModel(orderTypeTitle: "إستلام بضائعك", orderLocationFrom: "من شارع الملك فهد ", orderLocationTo: "الي شارع الملك عبد العزيز ", orderDate: "2023/12/3", buttonDetailsBackView: UIView())
    ]
    
    var endOrders: [EndOrders] = [
        EndOrders(endOrderTitle: "إستلام بضائعك", endOrderLocationFrom: "شارع الملك فهد", endOrderLocationTo: "شارع الملك عبد العزيز", endOrderDate: "15/6/2023"),
        EndOrders(endOrderTitle: "إستلام بضائعك", endOrderLocationFrom: "شارع الملك فهد", endOrderLocationTo: "شارع الملك عبد العزيز", endOrderDate: "15/6/2023")
    ]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()

        for inspector in orderInspectorViews {
            inspector.isHidden = true
        }
        
    }
    
    @IBAction func ordersButtonClick(_ sender: UIButton) {
        
        orderLabels.forEach({$0.textColor = .lightGray})
        for rowLabel in orderLabels {
            if rowLabel.tag == sender.tag {
                ordersCollectionView.isPagingEnabled = false
                let index = IndexPath(item: 0, section: 0)
                ordersCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                ordersCollectionView.isPagingEnabled = true
                rowLabel.textColor = .white
            }
        }
        
        orderInspectorViews.forEach({$0.isHidden = true})
        for rowInspector in orderInspectorViews {
            if rowInspector.tag == sender.tag {
                ordersCollectionView.isPagingEnabled = false
                let index = IndexPath(item: 1, section: 0)
                ordersCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                ordersCollectionView.isPagingEnabled = true
                rowInspector.isHidden = false
            }
        }
        
    }
    
    //MARK: - Functions
    private func configureCollectionView() {
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
        ordersCollectionView.register(UINib(nibName: "DataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DataCollectionViewCell")
        
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
        ordersCollectionView.register(UINib(nibName: "EndOrdersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EndOrdersCollectionViewCell")
    }
    

}



extension MyOrdersTest: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for rowlabel in orderLabels {
            if rowlabel.tag == 0 {
                return endOrders.count
            }else {
                return orderData.count
            }
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        for rowlabel in orderLabels {
            if rowlabel.tag == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EndOrdersCollectionViewCell", for: indexPath) as! EndOrdersCollectionViewCell
                cell.configureCell(model: endOrders[indexPath.row])
                return cell
            }else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as! DataCollectionViewCell
                cell.configureCell(model: orderData[indexPath.row])
                return cell
                
            }
        }
        return UICollectionViewCell()
    }
    
    
}


extension MyOrdersTest: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
