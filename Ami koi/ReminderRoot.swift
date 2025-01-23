//
//  ReminderRoot.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import Foundation
import CoreLocation

final class ReminderRoot : ObservableObject{
    @Published var location : LocationRoot = LocationRoot()
    @Published var address : String? = nil
    
    init(){
        getLocation()
    }
    
    func fetchAddress(location : CLLocation){
        Task{
            let addressRaw = try await LocationUtils.getAddressFromCoordinates(location: location)
            address = addressRaw?.replacingNewlineWithComma()
        }
    }
    
    func getLocation(){
        location.fetchLocation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){ [self] in
            location.objectWillChange.send()
            print("My Location \(location.lastLocation?.coordinate.latitude ?? 0)")
        }
    }
}
