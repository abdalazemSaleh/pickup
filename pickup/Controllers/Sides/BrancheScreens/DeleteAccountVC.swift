//
//  DeleteAccountVC.swift
//  pickup
//
//  Created by magdi sherif on 16/07/2023.
//

import UIKit

class DeleteAccountVC: UIViewController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    
    @IBAction func deleteAccountButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConfirmDeleteAccount") as! ConfirmDeleteAccount
        modalPresentationStyle = .popover
        present(vc, animated: true)
        
    }
    
    
    


}
