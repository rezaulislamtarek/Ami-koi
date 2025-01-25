//
//  LocationManagerService.swift
//  Ami koi
//
//  Created by Rezaul Islam on 25/1/25.
//

import Foundation
import CoreLocation
import UserNotifications

class LocationManagerService: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization() // Always authorization চাইবে
        locationManager.startUpdatingLocation()
    }

    func setupGeofences(for tasks: [MyTask]) {
        for task in tasks {
            addGeofence(for: task)
        }
    }

    private func addGeofence(for task: MyTask) {
        let center = CLLocationCoordinate2D(latitude: task.lat, longitude: task.lon)
        let region = CLCircularRegion(center: center, radius: 1000, identifier: task.title!)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        locationManager.startMonitoring(for: region)
        print("Location monitoring: \(task.title)")
    }

    // যখন Geofence এরিয়াতে প্রবেশ করবে
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Location enter")
        sendNotification(title: "টাস্ক এলাকা", body: "আপনি \(region.identifier) এলাকায় প্রবেশ করেছেন।")
    }

    // যখন Geofence এরিয়া থেকে বের হবে
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        sendNotification(title: "টাস্ক এলাকা", body: "আপনি \(region.identifier) এলাকা থেকে বের হয়েছেন।")
    }

    private func sendNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
