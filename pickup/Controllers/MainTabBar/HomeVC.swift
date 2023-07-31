//
//  HomeVC.swift
//  pickup
//
//  Created by magdi sherif on 09/07/2023.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var offersColletionView: UICollectionView!
    @IBOutlet weak var sideMenueButton: UIBarButtonItem!
    @IBOutlet weak var walletButtonClick: UIBarButtonItem!
    
    //MARK: - Vars
    var slider = [
        Slider(image: UIImage(named: "sliderphoto")!),
        Slider(image: UIImage(named: "cairo")!),
        Slider(image: UIImage(named: "nile")!)
    ]
    
    var offers = [
        Offers(offerTitle: "توصيل أغراضك", offerDescription: "أوصل لك أي شىء للمكان اللى تبية"),
        Offers(offerTitle: "إستلام بضائعك", offerDescription: "إستلم عنك بضائعك  واوصلها لحد بابك واركبها لك"),
        Offers(offerTitle: "نقل عفشك", offerDescription: "أنقل اغراضك مع الفك والتركيب فى اى وقت")
//        Offers(offerTitle: "توصيل أغراضك", offerDescription: "أوصل لك أي شىء للمكان اللى تبية"),Offers(offerTitle: "توصيل أغراضك", offerDescription: "أوصل لك أي شىء للمكان اللى تبية")
    ]
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        addIndicatorTotabBar()
        
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    //MARK: - Actions
    
    @IBAction func sideMenueButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenueVC") as! SideMenueVC
        navigationController?.pushViewController(vc, animated: true)
//        print("side menue")
    }
    
    @IBAction func walletButtonClick(_ sender: Any) {
//        print("wallet")
        
//        let vc = self.storyboard?.instantiateViewController(identifier: "WalletVC") as! WalletVC
//        vc.modalPresentationStyle = .popover
//        self.present(vc, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "WalletVC") as! WalletVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Functions to implment
    func configureCollectionView() {
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SliderCollectionViewCell")
        sliderCollectionView.reloadData()
        
        
        offersColletionView.dataSource = self
        offersColletionView.delegate = self
        offersColletionView.register(UINib(nibName: "OffersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OffersCollectionViewCell")
        offersColletionView.reloadData()
    }
    
    // add line indicator to tab bar
    private func addIndicatorTotabBar() {
        
        // the down indicator
//        let tabBar = self.tabBarController!.tabBar
//        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.blue, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height:  tabBar.frame.height), lineHeight: 2.0)
        
        // the upper indicator
//        let tabBar = self.tabBarController!.tabBar
//        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.blue, size:  CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
        
    }

}



//MARK: - Extensions
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndex = offers[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderDataVC") as! OrderDataVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == sliderCollectionView {
            return slider.count
        }else {
            return offers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case sliderCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
            let index = slider[indexPath.row]
            cell.sliderImageView.image = index.image
            return cell
            
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollectionViewCell", for: indexPath) as! OffersCollectionViewCell
            let index = offers[indexPath.row]
            cell.offerDescriptionLabel.text = index.offerDescription
            cell.offerTitleLabel.text = index.offerTitle
            return cell
        }

    }
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == sliderCollectionView {
            return CGSize(width: 350, height: 160)
        }else {
            return CGSize(width: 350, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollectionView {
            return 6
        }else {
            return 10

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollectionView {
            return 6
        }else {
            return 10

        }
    }
}
