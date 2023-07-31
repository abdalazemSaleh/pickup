//
//  CustomerService.swift
//  pickup
//
//  Created by magdi sherif on 16/07/2023.
//

import UIKit

class CustomerService: UIViewController {

    //MARK: - OutLets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var customerLogoImageView: UIImageView!
    
    @IBOutlet weak var detailsBackView: UIView!
    @IBOutlet weak var phoneBackView: UIView!
    @IBOutlet weak var nameBackView: UIView!
    
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        handleViews()
        setupBackgroundTap()
    }
    
    
    //MARK: - Actions
    @IBAction func connectButtonClick(_ sender: UIButton) {
        
    }
    
    //MARK: - Functions
    private func handleViews() {
        detailsBackView.addBorder()
        phoneBackView.addBorder()
        nameBackView.addBorder()
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyPoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyPoard() {
        view.endEditing(false)
    }
    
}
