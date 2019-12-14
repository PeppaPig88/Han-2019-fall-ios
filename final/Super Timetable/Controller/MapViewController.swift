//
//  MapViewController.swift
//  SchoolCalender
//
//  Created by Songming Han on 2019/12/7.
//  Copyright © Songming Han. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController {


    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //checkLocationServices()
        //centerViewOnUserLocation()

        // Do any additional setup after loading the view.
    }
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }else{
              
        }
    }
    func centerViewOnUserLocation()  {
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 2000,longitudinalMeters: 2000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            //mapView.showsUserLocation = true
            //centerViewOnUserLocation()
            break
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        }
    }
    
    func setupLocationManager(){
        //locationManager.delegate = self
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]){
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
