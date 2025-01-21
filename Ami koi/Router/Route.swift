//
//  Route.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import Foundation

enum Route : Hashable, Identifiable {
    var id : String  { UUID().uuidString }
    
    case homeView
    case setReminderView
    case reminderListView
    case mapSelectionView
}
