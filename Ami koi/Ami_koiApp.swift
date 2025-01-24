//
//  Ami_koiApp.swift
//  Ami koi
//
//  Created by Rezaul Islam on 19/1/25.
//

import SwiftUI

@main
struct Ami_koiApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private  var router : Router = Router()
  
    var body: some Scene {
        WindowGroup {
            RouteHandler()
                .environmentObject(router)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
