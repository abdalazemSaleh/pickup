//
//  DeliveryLocationVC.swift
//  pickup
//
//  Created by magdi sherif on 26/07/2023.
//

import UIKit
import MapKit
import CoreLocation

class DeliveryLocationVC: UIViewController {

    //MARK: - OutLets
    @IBOutlet var deliveryLocationViews: [UIView]!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    //MARK: - Vars
    var locationManager = CLLocationManager()
    
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        handleViews()
        configureLocationManager()
//        checkLocationEnable()
        if isLocationsEnable() {
            checkAuthorization()
        }else {
            showLocationEnableAlert(messsage: "please enable location service", type: "locationService")
        }
        setupBackgroundTap()
        
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func searchClickButton(_ sender: UIButton) {
        isTextEmpty()
    }
    
    @IBAction func nextStepClickButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConfirmOrderVC") as! ConfirmOrderVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    //MARK: - Functions
    
    // handle cyrcle views
    private func handleViews() {
        for x in deliveryLocationViews {
            x.layer.cornerRadius = x.frame.width / 2
        }
    }
    
    // configure location manager
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // check if location available
    private func isLocationsEnable() -> Bool {
        
        return CLLocationManager.locationServicesEnabled()
    }
    
    // check if search text field is empty
    private func isTextEmpty() {
        if searchTextField.text != "" {
            searchForDestination(destination: searchTextField.text!)
        }else {
            showAlert(message: "please type location")
        }
    }
    
    // logic of search
    private func searchForDestination(destination: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(destination) { places, error in
            guard let places = places, error == nil else {
                self.showAlert(message: "no data to display")
                return
            }
            
            guard let place = places.last else {return}
            
            guard let location = place.location else {
                self.showAlert(message: "cant find location, please try again")
                return
            }
            
            print(place.name ?? destination)
            print(place.country ?? destination)
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            
            let pin = MKPointAnnotation()
            pin.coordinate = location.coordinate
            pin.title = "\(String(describing: place.name))"
            pin.subtitle = "\(String(describing: place.locality))"
            self.mapView.addAnnotation(pin)
            
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            self.mapView.setRegion(region, animated: true)
            
        }
        
        
    }
    
    //
//    private func checkLocationEnable() {
//        if isLocationsEnable() {
//            checkAuthorization()
//        }else {
//            showLocationEnableAlert(messsage: "please enable location service", type: "locationService")
//        }
//    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    private func checkAuthorization() {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted:
            showLocationEnableAlert(messsage: "authorization restricted", type: "locationService")
            break
            
        case .denied:
            showLocationEnableAlert(messsage: "please enable location service", type: "locationService")
            break
            
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
            
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
            
        @unknown default:
            break
        }
    }
    
    private func showLocationEnableAlert(messsage: String, type: String) {
        let alert = UIAlertController(title: "Alert", message: messsage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
            if type == "locationService" {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
        }))
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(false)
    }

}



//MARK: - Extensions

extension DeliveryLocationVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location.coordinate)
            zoomToUserLocation(location: location)
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func zoomToUserLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted:
            showLocationEnableAlert(messsage: "authorization restricted", type: "locationService")
            break
            
        case .denied:
            showLocationEnableAlert(messsage: "please enable location service", type: "locationService")
            break
            
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
            
        case .authorizedWhenInUse:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            break
            
        @unknown default:
            break
        }
    }
    
    
}
