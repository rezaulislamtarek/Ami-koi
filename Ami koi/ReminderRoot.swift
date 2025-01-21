//
//  ReminderRoot.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import Foundation

final class ReminderRoot : ObservableObject{
    @Published var location : LocationRoot = LocationRoot()
    
    
    init(){
        getLocation()
    }
    
    func getLocation(){
        location.fetchLocation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){ [self] in
            location.objectWillChange.send()
            print("My Location \(location.lastLocation?.coordinate.latitude ?? 0)")
        }
        
        
    }
}
