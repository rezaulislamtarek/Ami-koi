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
    @StateObject private var locationManagerService = LocationService()
    
    init(){
        requestNotificationPermission()
        configureNotificationDelegate()
    }
    
    var body: some Scene {
        WindowGroup {
            RouteHandler()
                .environmentObject(router)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locationManagerService)
               
        }
    }
    
    private func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                if success {
                    print("Notification permission granted")
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    
    private func configureNotificationDelegate() {
            UNUserNotificationCenter.current().delegate = NotificationDelegate.shared
        }
    
}
