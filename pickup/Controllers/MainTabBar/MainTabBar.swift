//
//  MainTabBar.swift
//  pickup
//
//  Created by magdi sherif on 09/07/2023.
//

import UIKit


class MainTabBar: UITabBarController, UITabBarControllerDelegate {

//    let selectionView: UIView = {
//            let view = UIView()
//            view.backgroundColor = .red
//            view.layer.cornerRadius = 6
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
////    var tabBaraTraillingPosition: NSLayoutConstraint!
//
//    var tabBarLeadingPosition: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        self.selectedIndex = 3

//        setupSelectionView()

        // Do any additional setup after loading the view.
    }
    
    
//    func setupSelectionView() {
//            tabBarLeadingPosition = selectionView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 0)
//            tabBar.addSubview(selectionView)
//            NSLayoutConstraint.activate([
//                selectionView.topAnchor.constraint(equalTo: tabBar.topAnchor),
//                selectionView.heightAnchor.constraint(equalToConstant: 6),
//                selectionView.widthAnchor.constraint(equalToConstant: tabBar.frame.size.width / 4),
//            ])
//                }
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//        tabBarLeadingPosition.constant = (tabBar.frame.size.width / 4) * CGFloat(item.tag)
//                    UIView.animate(withDuration: 0.1) {
//                        self.view.layoutIfNeeded()
//                    }
//
//        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
//
//                    let timeInterval: TimeInterval = 0.3
//                    let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
//                        barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
//                    }
//                    propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
//                    propertyAnimator.startAnimation()
//    }
//
    
    

}
