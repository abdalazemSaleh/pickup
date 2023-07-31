//
//  EditFirstNameVC.swift
//  pickup
//
//  Created by magdi sherif on 19/07/2023.
//

import UIKit

class EditFirstNameVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var firstNameBackView: UIView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var editFirstNameContainerView: UIView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundTap()
        
    }
    
    //MARK: - Actions
    @IBAction func editFirstNameTextField(_ sender: UIButton) {
        
        let firstName = UserNames(firstName: firstNameTextField.text ?? "First Name")
        NotificationCenter.default.post(name: NSNotification.Name("sendFirstName"), object: nil, userInfo: ["firstNameSent": firstName])
        
        dismiss(animated: true)
    }
    
    
    //MARK: - Functions
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyPoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyPoard() {
        view.endEditing(false)
    }
    

}
