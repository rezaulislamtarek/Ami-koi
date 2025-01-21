//
//  RouteHandler.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import SwiftUI

struct RouteHandler : View {
    @EnvironmentObject private var router : Router
    var body: some View {
        NavigationStack(path: $router.navPath) {
            HomeView()
                .navigationDestination(for: Route.self) { route in
                    switch route{
                    case .homeView : HomeView()
                    case .reminderListView : RemindersView()
                    case .setReminderView : SetReminderView()
                    case .mapSelectionView: MapSelectionView()
                    }
                }
        }
        .sheet(item: $router.presentedSheet) { item in
            if let route = item.destination as? Route {
                switch route {
                case .mapSelectionView :
                    MapSelectionView()
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                default:
                    EmptyView()
                }
            }
        }
    }
}
