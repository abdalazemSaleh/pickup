//
//  MyAccountVC.swift
//  pickup
//
//  Created by magdi sherif on 13/07/2023.
//

import UIKit

class MyAccountVC: UIViewController {
    
    
//    func editUserNames(firstName: String, lastName: String) {
//        testNames.text = firstName
//    }
    

    //MARK: - Outlets
    @IBOutlet weak var editLastNameButton: UIButton!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var lastNameBackView: UIView!
    
    @IBOutlet weak var editFirstnameButton: UIButton!
    @IBOutlet weak var firstNamelabel: UILabel!
    @IBOutlet weak var firstNameBackView: UIView!
    
    @IBOutlet weak var editUserImageButton: UIButton!
    @IBOutlet weak var editUserImageBackView: UIView!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userImageBackView: UIView!
    
    
    
    //MARK: - Vars
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        editUserViews()
        setFirstNameNotification()
        setLastNameNotification()
        
        userImageView.layer.masksToBounds = true
        

    }
    
    
    //MARK: - Actions
    @IBAction func editUserImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        userImageView.layer.masksToBounds = true
        present(imagePicker, animated: true)
        
    }
    
    
    @IBAction func editFirstNameClickButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditFirstNameVC") as! EditFirstNameVC
        modalPresentationStyle = .popover
        present(vc, animated: true)
    }
    
    @IBAction func editLastNameClickButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditLastNameVC") as! EditLastNameVC
        modalPresentationStyle = .popover
        present(vc, animated: true)
    }
    
    
    //MARK: - Functions
    private func editUserViews() {
        userImageBackView.layer.cornerRadius = userImageBackView.frame.width / 2
        editUserImageBackView.layer.cornerRadius = editUserImageBackView.frame.width / 2
        
    }
    
    private func setFirstNameNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(editFirstName), name: NSNotification.Name("sendFirstName"), object: nil)
    }
    
    @objc func editFirstName(notification: Notification) {
        if let userName = notification.userInfo?["firstNameSent"] as? UserNames {
            firstNamelabel.text = userName.firstName
        }
    }
    
    
    private func setLastNameNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(editLastName), name: NSNotification.Name("sendLastName"), object: nil)
    }
    
    @objc func editLastName(notification: Notification) {
        
        if let lastName = notification.userInfo?["lastNameSent"] as? UserNames {
            LastNameLabel.text = lastName.lastName
        }
    }

}


//MARK: - Extensions
extension MyAccountVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        dismiss(animated: true)
        userImageView.layer.masksToBounds = true
        userImageView.image = image
//        editUserViews()
    }
}

