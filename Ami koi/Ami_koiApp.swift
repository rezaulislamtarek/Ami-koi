//
//  Ami_koiApp.swift
//  Ami koi
//
//  Created by Rezaul Islam on 19/1/25.
//

import SwiftUI

@main
struct Ami_koiApp: App {
    @StateObject private var locationRoot : LocationRoot = LocationRoot()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationRoot)
        }
    }
}
