//
//  NewAccountVC.swift
//  pickup
//
//  Created by magdi sherif on 09/07/2023.
//

import UIKit
import CountryPickerView


class LoginVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var phoneNumberBackView: UIView!
    @IBOutlet weak var passwordBackView: UIView!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleViews()
        
        phoneNumberTextField.text = "01001237654"
        passwordTextField.text = "12345678"

    }
    
    
    
    //MARK: - Actions
    
    @IBAction func continueClickButton(_ sender: UIButton) {
        
//        checkInputFields()
        fetchUserData()
    }
    
    //MARK: - views functions
    private func handleViews() {
        phoneNumberBackView.layer.borderWidth = 0.3
        phoneNumberBackView.layer.borderColor = UIColor.systemGray.cgColor
        
        passwordBackView.layer.borderWidth = 0.3
        passwordBackView.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    
    func fetchUserData() {
        
        guard let phoneNumber = phoneNumberTextField.text else {
            
            showErrorMessage(message: "enter your phone number")
            print("enter your phone number")
            return
        }
        
        guard let password = passwordTextField.text else {
            showErrorMessage(message: "enter password")
            print("enter password")
            return
        }
//        UserApi.shared.loginUser(phone: phoneNumber, password: password) { result in
//            
//            switch result {
//
//            case .success(let response):
//                print(response)
//
//                if response.accessToken != nil {
//                    
//                    self.setUserDefaults(response: response.accessToken!, key: "token")
//                    self.setUserDefaults(response: response.user!.fName, key: "firstName")
//                    self.setUserDefaults(response: response.user!.lName, key: "lastName")
////                    UserDefaults.standard.set(response.accessToken, forKey: "token")
//
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBar") as! MainTabBar
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true)
////                    let alert = UIAlertController(title: "logged", message: "created", preferredStyle: .alert)
////                    let action = UIAlertAction(title: "ok", style: .default)
////                    alert.addAction(action)
////                    self.present(alert, animated: true)
////                    print(response.accessToken ?? "no access token")
//                }else {
//                    
//                    if let phoneError = response.phone, !phoneError.isEmpty, let error = phoneError.first {
//                        
//                        self.showErrorMessage(message: error)
//                    }
//                    if let passwordError = response.password, !passwordError.isEmpty, let error = passwordError.first {
//                        
//                        self.showErrorMessage(message: error)
//                    }
//
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//
//        }
    }
    
    private func setUserDefaults(response: String, key: String) {
        UserDefaults.standard.set(response, forKey: key)
    }
    
    
    private func showErrorMessage(message: String) {
        let alert = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
//        print("error\(String(describing: response.error))")
    }
    
    

}
