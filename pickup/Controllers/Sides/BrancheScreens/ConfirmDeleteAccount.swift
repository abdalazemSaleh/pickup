//
//  ConfirmDeleteAccount.swift
//  pickup
//
//  Created by magdi sherif on 16/07/2023.
//

import UIKit

class ConfirmDeleteAccount: UIViewController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setBackgroundTap()

    }
    
    //MARK: - Actions
    
    // confirm delete account
    @IBAction func confirmDeleteAccount(_ sender: UIButton) {
    }
    
    // dismiss
    @IBAction func dismissDeleteButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func setBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyPoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyPoard() {
        view.endEditing(false)
    }
    
}
