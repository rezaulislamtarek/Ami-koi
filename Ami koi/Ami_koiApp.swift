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
    @StateObject private var locationManagerService = LocationManagerService()
    
    init(){
        requestNotificationPermission()
    }
    
    var body: some Scene {
        WindowGroup {
            RouteHandler()
                .environmentObject(router)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear{
                    let context = persistenceController.container.viewContext
                    let taskManager = TaskManager(context: context)
                    let tasks = taskManager.fetchTasks()
                    print(tasks.debugDescription)
                    locationManagerService.setupGeofences(for: tasks)
                }
        }
    }
    
    func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                if success {
                    print("Notification permission granted")
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    
}
