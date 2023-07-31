//
//  OrdersVC.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import UIKit

class OrdersVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var ordersCollectionView: UICollectionView!
    @IBOutlet weak var dataShowCollectionView: UICollectionView!
    
    
    //MARK: - Vars
    var ordersButton: [orderType] = [
        orderType(name: "طلبات منتهية", isSelect: false),
        orderType(name: "طلبات حالية", isSelect: true)
    ]
    
    var orderData: [OrderTypeModel] = [
        OrderTypeModel(orderTypeTitle: "توصيل أغراضك", orderLocationFrom: "من شارع الملك فهد ", orderLocationTo: "الي شارع الملك عبد العزيز ", orderDate: "2023/12/3", buttonDetailsBackView: UIView()),
        OrderTypeModel(orderTypeTitle: "إستلام بضائعك", orderLocationFrom: "من شارع الملك فهد ", orderLocationTo: "الي شارع الملك عبد العزيز ", orderDate: "2023/12/3", buttonDetailsBackView: UIView())
    ]
    
    var endOrders: [EndOrders] = [
        EndOrders(endOrderTitle: "إستلام بضائعك", endOrderLocationFrom: "شارع الملك فهد", endOrderLocationTo: "شارع الملك عبد العزيز", endOrderDate: "15/6/2023"),
        EndOrders(endOrderTitle: "إستلام بضائعك", endOrderLocationFrom: "شارع الملك فهد", endOrderLocationTo: "شارع الملك عبد العزيز", endOrderDate: "15/6/2023")
    ]
    
//    var selectedIndex = 1
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        getActiveOrders()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Functions
    private func configureCollectionView() {
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
//        ordersCollectionView.reloadData()
        ordersCollectionView.register(UINib(nibName: "OrdersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrdersCollectionViewCell")
        
        dataShowCollectionView.dataSource = self
        dataShowCollectionView.delegate = self
        dataShowCollectionView.register(UINib(nibName: "DataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DataCollectionViewCell")
        
        dataShowCollectionView.dataSource = self
        dataShowCollectionView.delegate = self
        dataShowCollectionView.register(UINib(nibName: "EndOrdersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EndOrdersCollectionViewCell")
        
        
    }
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BpY2t1cGtzYS5jb20vUGlja1VwL2FwaS91c2VyL2xvZ2luIiwiaWF0IjoxNjg5NTA3MzkxLCJleHAiOjE2ODk1MTA5OTEsIm5iZiI6MTY4OTUwNzM5MSwianRpIjoiVDR3MDlCUVpIZHExaTNjdSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.HX2qnjeTTjVdwlzObacgfGqSy0pp6hVBOxUKo6rS7S8"
    private func getActiveOrders() {
        OrderTypesApi.shared.getActiveOrders(token: token) { result in
            switch result {
                
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Actions

    
    @IBAction func sideMenueButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenueVC") as! SideMenueVC
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension OrdersVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case ordersCollectionView:
            ordersButton.forEach ({$0.isSelect = false})
            ordersButton[indexPath.row].isSelect = true
            ordersCollectionView.reloadData()
            
//            if indexPath.row == 0 {
//                let selectedIndex = orderData[indexPath.row]
//            }else {
//                let selectedIndex = endOrders[indexPath.row]
//            }
            
            
//            let selectedIndex = ordersButton[indexPath.row].isSelect
//            if selectedIndex == false {
//                print("1111")
//                orderData[indexPath.row].buttonDetailsBackView.backgroundColor? = UIColor.black
//            }else {
//                orderData[indexPath.row].buttonDetailsBackView.backgroundColor? = UIColor.red
//
//            }
            
            switch indexPath.row {
            case 0:

                orderData[indexPath.row].buttonDetailsBackView.backgroundColor? = UIColor.black
                print(indexPath.row)
                ordersCollectionView.reloadData()
            case 1:

                print(indexPath.row)
                ordersCollectionView.reloadData()
            default:
                break
            }
        case dataShowCollectionView:
            print("11111")

        default:
            break
        }
        
        
        // switch collectionView {
        // case ordersCollectionView :
        
//        ordersButton.forEach ({$0.isSelect = false})
//        ordersButton[indexPath.row].isSelect = true
//        ordersCollectionView.reloadData()
        
        // switch indexPath.row {
        // case 0 :
        // current orders
        // case 1 :
        // finished orders
        // case showOrdersCollectionView :
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ordersCollectionView {
            return ordersButton.count
        }else {
            return orderData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case ordersCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as! OrdersCollectionViewCell
            cell.config(model: ordersButton[indexPath.row])
            return cell

        case dataShowCollectionView :
//            ordersButton.forEach ({$0.isSelect = false})
            let selectedIndex = ordersButton[indexPath.row].isSelect
            if  selectedIndex == true {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as! DataCollectionViewCell
                cell.configureCell(model: orderData[indexPath.row])
                return cell
            }else {
//                ordersButton.forEach ({$0.isSelect = true})
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EndOrdersCollectionViewCell", for: indexPath) as! EndOrdersCollectionViewCell
                cell.configureCell(model: endOrders[indexPath.row])
                return cell
            }
        default:
            break
        }

        return UICollectionViewCell()
        
        
//        switch collectionView {
//        case ordersCollectionView:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as! OrdersCollectionViewCell
//            cell.config(model: ordersButton[indexPath.row])
//            switch indexPath.row {
//            case 0 :
//                orderData[indexPath.item].buttonDetailsBackView.backgroundColor = .darkGray
//            case 1 :
//                orderData[indexPath.row].buttonDetailsBackView.backgroundColor = .blue
//            default:
//                break
//            }
//            return cell
//
//        default:
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as! DataCollectionViewCell
//            cell.configureCell(model: orderData[indexPath.row])
//
//            switch indexPath.row {
//            case 0:
//                cell.orderDetailsButtonView.backgroundColor = .darkGray
//            case 1:
//                cell.orderDetailsButtonView.backgroundColor = .blue
//            default:
//                break
//            }
//            return cell
//        }

    }
    
    
}


extension OrdersVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case ordersCollectionView :
            return CGSize(width: 120, height: 55)
        default:
            return CGSize(width: 350, height: 182)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == ordersCollectionView {
            return CGFloat()
        }else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == ordersCollectionView {
            return CGFloat()
        }else {
            return 20
        }
    }
    
    
}
