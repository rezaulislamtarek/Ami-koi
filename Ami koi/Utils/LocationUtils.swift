//
//  LocationUtils.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import Foundation
import CoreLocation
import Contacts

final class LocationUtils {
   static func getAddressFromCoordinates(location : CLLocation) async throws -> String? {
        //let location = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        
        let placemarks = try await geocoder.reverseGeocodeLocation(location, preferredLocale: nil)
       
      
        
        guard let placemark = placemarks.first else {
            print("No placemark found")
            return nil
        }
      
       
        if let postalAddress = placemark.postalAddress {
            let postalAddressFormatter = CNPostalAddressFormatter()
            postalAddressFormatter.style = .mailingAddress
            return postalAddressFormatter.string(from: postalAddress)
        } else {
            print("No postal address found")
            return nil
        }
    }
}
