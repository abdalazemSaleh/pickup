//
//  ShipmentPhotosVCViewController.swift
//  pickup
//
//  Created by magdi sherif on 24/07/2023.
//

import UIKit
import Gallery
import PhotosUI


class ShipmentPhotosVC: UIViewController {

    //MARK: - OutLets
    @IBOutlet var shipmentPhotosViews: [UIView]!
    @IBOutlet weak var shipmentPhotosCollectionView: UICollectionView!
    @IBOutlet weak var nextStepClickButton: UIButton!
    
    
    //MARK: - vars
    var shipmentPhotos = [UIImage]()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        handleViews()
        configureCollectionView()
        
        nextStepClickButton.isEnabled = false
        checkValidation()
        
    }
    
    //MARK: - Actions
    @IBAction func uploadImagesButtonClick(_ sender: UIButton) {
        getPhotos()
    }
    
    @IBAction func nextStepButtonClick(_ sender: UIButton) {
        print("11111")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LocationVC") as! LocationVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Functions
    private func handleViews() {
        for x in shipmentPhotosViews {
            x.layer.cornerRadius = x.frame.width / 2
        }
    }
    
    private func configureCollectionView() {
        shipmentPhotosCollectionView.delegate = self
        shipmentPhotosCollectionView.dataSource = self
        shipmentPhotosCollectionView.register(UINib(nibName: "ShipmentPhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShipmentPhotosCollectionViewCell")
    }
    
    private func getPhotos() {
        var config = PHPickerConfiguration()
        config.filter = .any(of: [.images, .livePhotos])
        config.selectionLimit = 100
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    private func checkValidation() {
        if shipmentPhotos.count != 0 {
            nextStepClickButton.isEnabled = true
        }
        
    }

}




extension ShipmentPhotosVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shipmentPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShipmentPhotosCollectionViewCell", for: indexPath) as! ShipmentPhotosCollectionViewCell
        let index = shipmentPhotos[indexPath.row]
        cell.shipmentPhotos.image = index
        return cell
    }
    
    
}

extension ShipmentPhotosVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}


extension ShipmentPhotosVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.shipmentPhotos.append(image)
                        self.shipmentPhotosCollectionView.reloadData()
                        self.checkValidation()
                    }
                }else {
                    self.showErrorAlert()

                }
            }
        }
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "warning", message: "you have to select at least one image !", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
}
