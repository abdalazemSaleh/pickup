//
//  NewAccountVC.swift
//  pickup
//
//  Created by magdi sherif on 09/07/2023.
//

import UIKit

class NewAccountVC: UIViewController {

    
    //MARK: - Outlets
     
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var lastNametextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var confirmPasswordBackView: UIView!
    @IBOutlet weak var passwordBackView: UIView!
    @IBOutlet weak var emailBackView: UIView!
    @IBOutlet weak var lastNameBackView: UIView!
    @IBOutlet weak var firstNameBackView: UIView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleViews()

    }
    
    
    //MARK: - Actions
    @IBAction func continueButtonClick(_ sender: UIButton) {
        
        fetchNewUserData()
        
    }
    
    
    //MARK: - Functions to implment
    private func handleViews() {
        confirmPasswordBackView.layer.borderWidth = 0.3
        confirmPasswordBackView.layer.borderColor = UIColor.systemGray.cgColor
        
        passwordBackView.layer.borderWidth = 0.3
        passwordBackView.layer.borderColor = UIColor.systemGray.cgColor
        
        emailBackView.layer.borderWidth = 0.3
        emailBackView.layer.borderColor = UIColor.systemGray.cgColor
        
        lastNameBackView.layer.borderWidth = 0.3
        lastNameBackView.layer.borderColor = UIColor.systemGray.cgColor
        
        firstNameBackView.layer.borderWidth = 0.3
        firstNameBackView.layer.borderColor = UIColor.systemGray.cgColor
        
    }
    
    private func fetchNewUserData() {
        
        guard let firstName = firstNameTextField.text else {
            showErrorMessage(message: "enter your first name")
            return
        }
        
        guard let lastName = lastNametextField.text else {
            showErrorMessage(message: "enter your last name")
            return
        }
        
        guard let email = emailtextField.text else {
            showErrorMessage(message: "enter your email")
            return
        }
        
        guard let password = passwordTextField.text else {
            showErrorMessage(message: "enter your password")
            return
        }
        
        guard let passwordConfirmation = passwordConfirmationTextField.text else {
            showErrorMessage(message: "enter your password confirmation")
            return
        }
        
//        RegisterApi.shared.registerApi(firstName: firstName, lastName: lastName, email: email, password: password, passwordConfiramtion: passwordConfirmation, phone: "123123123") { result in
//            switch result {
//
//            case .success(let response):
//                print(response)
//                
//                if response.accessToken != nil {
//                    let alert = UIAlertController(title: "logged", message: "created", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "ok", style: .default)
//                    alert.addAction(action)
//                    self.present(alert, animated: true)
//                    print(response.accessToken ?? "no access token")
//                    
//                }else {
//                    
//                    let alert = UIAlertController(title: "error", message: "error while register", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "ok", style: .default)
//                    alert.addAction(action)
//                    self.present(alert, animated: true)
////                    print(response.accessToken ?? "no access token")
//                    
////                    if let emailError = response.email, !emailError.isEmpty, let error = response.email?.first {
////                        self.showErrorMessage(message: error)
////                    }
////
////                    if let firstNameError = response.fName, !firstNameError.isEmpty, let error = response.fName?.first {
////                        self.showErrorMessage(message: error)
////                    }
////
////                    if let lastNameError = response.lName, !lastNameError.isEmpty, let error = response.lName?.first {
////                        self.showErrorMessage(message: error)
////                    }
////
////                    if let passwordError = response.password, !passwordError.isEmpty, let error = response.password?.first {
////                        self.showErrorMessage(message: error)
////                    }
//                    
//                    
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    
    private func showErrorMessage(message: String) {
        let alert = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    
    
    
    
    

}
