//
//  LocationRoot.swift
//  Ami koi
//
//  Created by Rezaul Islam on 19/1/25.
//

import Foundation
import CoreLocation

class LocationRoot : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var locationStatus : CLAuthorizationStatus?
    @Published var lastLocation : CLLocation?
    
    override init() {
        super.init()
        
    }
    
    func useLocation(){
        locationManager.delegate =  self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString : String{
        guard let status = locationStatus else {
            return "unknown"
        }
        switch status {
            
        case .notDetermined: return "notDetermined"
            
        case .restricted: return "restricted"
            
        case .denied: return "denied"
            
        case .authorizedAlways: return "authorizedAlways"
            
        case .authorizedWhenInUse: return "authorizedWhenInUse"
            
        @unknown default: return "unknown"
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location status: \(status.rawValue)")
        locationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print("Location \(location)")
    }
    
}
