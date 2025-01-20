//
//  TimeOfDayGreetings.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import Foundation

enum TimeOfDayGreetings : String {
    case morning = "Good Morning"
    case noon = "Good Noon"
    case afternoon = "Good Afternoon"
    case evening = "Good Evening"
    case night = "Good Night"
    
    static func getGreeting(for date: Date = Date()) -> Self{
        let calender = Calendar.current
        let hour = calender.component(.hour, from: date)
        switch hour {
        case 5..<12:
            return  .morning
        case 12:
            return  .noon
        case 13..<17:
            return  .afternoon
        case 17..<21:
            return  .evening
        default:
            return  .night
        }
    }
}
