//
//  LocationVC.swift
//  pickup
//
//  Created by magdi sherif on 25/07/2023.
//

import UIKit
import MapKit
import CoreLocation


class LocationVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var locationViews: [UIView]!
    
    
    //MARK: - Vars
    var locationManager = CLLocationManager()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        handleViews()
        configureLocationManager()
//        checkLocationEnabled()
        if isLocationEnable() {
            checkAuthorization()
        }else {
            showAlert(message: "please enable location service", type: "locationService")
        }
        
        setupBackgroundTap()
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        isTextEmpty()
    }
    
    @IBAction func nextStepClickButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DeliveryLocationVC") as! DeliveryLocationVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Functions
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func handleViews() {
        for x in locationViews {
            x.layer.cornerRadius = x.frame.width / 2
        }
    }
    
    
    private func isLocationEnable() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    private func isTextEmpty() {
        if searchTextField.text != "" {
            searchForDestination(destination: searchTextField.text!)
        }else {
            showAlert(message: "please type a location to can search")
        }
    }
    
    
    private func searchForDestination(destination: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(destination) { places, error in
            
            guard let places = places, error == nil else {
                self.showAlert(message: "no data to display")
                return
            }
            guard let place = places.last else {return}
            
            print(place.name ?? "")
            print(place.country ?? "")
            
            guard let location = place.location else {
                self.showAlert(message: "cant find location")
                return }
//            self.searchTextField.text = ""
            
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
//    private func checkLocationEnabled() {
//        if isLocationEnable() {
//            checkAuthorization()
//        }else {
//            showAlert(message: "please enable location service")
//        }
//    }
    
    
    private func checkAuthorization() {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted:
            showAlert(message: "authorization restricted", type: "locationService")
            break
            
        case .denied:
            showAlert(message: "please enable location service", type: "locationService")
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
    
    
    private func showAlert(message: String, type: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
            if type == "locationService" {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }else {
                
            }
        }))
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyPoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyPoard() {
        view.endEditing(false)
    }
    
    
}



//MARK: - Extensions

extension LocationVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location.coordinate)
            zoomToUserLocation(location: location)
        }
        locationManager.stopUpdatingLocation()
    }
    
    func zoomToUserLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            showAlert(message: "please enable location service", type: "locationService")
            break
            
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
            
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            showAlert(message: "authorization restricted", type: "locationService")
            break
        @unknown default:
            break
        }
    }
}
