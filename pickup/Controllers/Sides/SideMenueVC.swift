//
//  SideMenueVC.swift
//  pickup
//
//  Created by magdi sherif on 11/07/2023.
//

import UIKit

class SideMenueVC: UIViewController {

    
    //MARK: - Outlets

    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2

    }
    
    
    //MARK: - Actions
    
    //Log Out
    @IBAction func logOutClickButton(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
    }
    
    //Account Management
    @IBAction func accountManagmentButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DeleteAccountVC") as! DeleteAccountVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //About PickUp
    @IBAction func aboutBickupButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier:  "AboutPickupVC") as! AboutPickupVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Common Questions
    @IBAction func commonQuestionsButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(identifier: "CommonQuestions") as! CommonQuestions
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Customer Service
    @IBAction func customerService(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CustomerService") as! CustomerService
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Terms And Conditions
    @IBAction func termsAndConditions(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TermsAndConditions") as! TermsAndConditions
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Language
    @IBAction func languageButton(_ sender: UIButton) {
    }
    
    // Documents
    @IBAction func documentButtonClick(_ sender: UIButton) {
    }
    
    //Wallet
    @IBAction func walletButtonClick(_ sender: UIButton) {
    }
    
    
    

}

