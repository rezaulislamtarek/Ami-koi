//
//  LocationManager.swift
//  Ami koi
//
//  Created by Rezaul Islam on 22/1/25.
//

import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), // ডিফল্ট লোকেশন
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // অনুমতি চাইবে
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
            }
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
        }
    }
}


struct IdentifiableLocation: Identifiable {
    let id = UUID() // প্রতিটি এনোটেশনকে আলাদা করতে ইউনিক আইডি
    let coordinate: CLLocationCoordinate2D
}
