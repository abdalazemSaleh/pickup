//
//  StartVC.swift
//  pickup
//
//  Created by magdi sherif on 09/07/2023.
//

import UIKit

class StartVC: UIViewController {

    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    
    @IBAction func newAccountButton(_ sender: UIButton) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "PhoneNumberVC") as! PhoneNumberVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
