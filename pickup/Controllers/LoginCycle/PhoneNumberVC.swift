//
//  PhoneNumberVC.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import UIKit

class PhoneNumberVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var phoneBackView: UIView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneBackView.layer.borderWidth = 0.3
        phoneBackView.layer.borderColor = UIColor.systemGray.cgColor

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func continueClickButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
        navigationController?.pushViewController(vc, animated: true)
        
    }
    


}
