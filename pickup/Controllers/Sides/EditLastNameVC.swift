//
//  EditLastNameVC.swift
//  pickup
//
//  Created by magdi sherif on 19/07/2023.
//

import UIKit

class EditLastNameVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var editLastNametextField: UITextField!
    @IBOutlet weak var editLastNameBackView: UIView!
    @IBOutlet weak var editLastNameLabel: UILabel!
    @IBOutlet weak var editLastNameContainerView: UIView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundTap()

    }
    
    //MARK: - Actions
    @IBAction func editLastNameClickButton(_ sender: UIButton) {
        
        let lastName = UserNames(lastName: editLastNametextField.text ?? "last name")
        NotificationCenter.default.post(name: NSNotification.Name("sendLastName"), object: nil, userInfo: ["lastNameSent": lastName])
        dismiss(animated: true)
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyPoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyPoard() {
        view.endEditing(false)
    }


}
