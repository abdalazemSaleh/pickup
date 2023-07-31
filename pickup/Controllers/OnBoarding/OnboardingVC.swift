//
//  OnboardingVC.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import UIKit

class OnboardingVC: UIViewController {
    
    var onboard = [
        Onboarding(image: UIImage(named: "truck")!, title: "نقل وتوصيل البضائع", description: "بيك أب لنقل وتوصيل البضائع من والى اى مكان ترغب فيه"),
        Onboarding(image: UIImage(named: "chooseOffer")!, title: "اختر العرض الي يناسبك", description: "قدم طلب واختار العرض الي يناسبك مع المندوب وابدء فورا"),
        Onboarding(image: UIImage(named: "location")!, title: "تابع طلبك أول بأول", description: "تابع طلبك مباشرة مع المندوب وتواصل معه")
    ]
    
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nextClickButton: UIButton!
    @IBOutlet weak var onboardDescriptionlabel: UILabel!
    @IBOutlet weak var onboardTitleLabel: UILabel!
    @IBOutlet weak var onboardImageView: UIImageView!
    
    var currentPage = 0 {
        didSet{
            pageController.currentPage = currentPage
                if currentPage == onboard.count - 1 {
                    nextClickButton.setTitle("لنبداء الان", for: .normal)
                }else {
                    nextClickButton.setTitle("التالي", for: .normal)
                
                }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upatePageController()
        updateTextAndImage()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextClickPutton(_ sender: Any) {
        
        if currentPage == onboard.count - 1 {
            print("222222")
            let vc = storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartVC
            navigationController?.pushViewController(vc, animated: true)

//            let vc = storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartVC
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
            
        }else {
            currentPage += 1
            upatePageController()
            updateTextAndImage()
        }
//        if currentPage < pageController.numberOfPages {
//            currentPage += 1
//            upatePageController()
//            updateTextAndImage()
//        } else if currentPage > pageController.numberOfPages {
//
//            print("hhhhhhh")
//        }
        
    }
    
    private func upatePageController() {
//        currentPage += 1
        pageController.currentPage = currentPage
    }
    
    private func updateTextAndImage() {
        
        
//        currentPage += 1
        if pageController.currentPage == 2 {
            onboardTitleLabel.text = "نقل وتوصيل البضائع"
            onboardDescriptionlabel.text = "بيك أب لنقل وتوصيل البضائع من والى اى مكان ترغب فيه"
            onboardImageView.image = UIImage(named: "truck")
            
        } else if pageController.currentPage == 1 {
            onboardTitleLabel.text = "اختر العرض الي يناسبك"
            onboardDescriptionlabel.text = "قدم طلب واختار العرض الي يناسبك مع المندوب وابدء فورا"
            onboardImageView.image = UIImage(named: "chooseOffer")
        }else if pageController.currentPage == 0 {
            onboardTitleLabel.text = "تابع طلبك أول بأول"
            onboardDescriptionlabel.text = "تابع طلبك مباشرة مع المندوب وتواصل معه"
            onboardImageView.image = UIImage(named: "location")
        }
    }
    

}
