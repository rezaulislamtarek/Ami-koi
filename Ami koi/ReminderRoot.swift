//
//  ReminderRoot.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import Foundation
import CoreLocation

final class ReminderRoot : ObservableObject{
    @Published var address : String? = nil
    
     
    
    func fetchAddress(location : CLLocation){
        Task{
            let addressRaw = try await LocationUtils.getAddressFromCoordinates(location: location)
            address = addressRaw?.replacingNewlineWithComma()
        }
    }
    
     
}
