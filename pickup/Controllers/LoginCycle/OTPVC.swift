//
//  OTPVC.swift
//  pickup
//
//  Created by magdi sherif on 10/07/2023.
//

import UIKit

class OTPVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet var otpBackViews: [UIView]!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        for x in otpBackViews {
            x.layer.borderWidth = 0.3
            x.layer.borderColor = UIColor.systemGray.cgColor
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    
    @IBAction func continueClickButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewAccountVC") as! NewAccountVC
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
