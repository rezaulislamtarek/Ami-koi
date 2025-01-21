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
    @Published var address : String?
    
    @Published var lastLocation : CLLocation? = .none {
        didSet{
            DispatchQueue.main.async { [weak self] in
                Task{
                    if let self {
                        self.address = try await LocationUtils.getAddressFromCoordinates(location: (self.lastLocation!))
                        self.stopLocationUpdate()
                    }
                }
            }
        }
    }
    
    
    override init() {
        super.init()
        
    }
    

    
    func fetchLocation(){
        locationManager.delegate =  self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationUpdate(){
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
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
