//
//  HomeView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 19/1/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var location : LocationRoot 
    var body: some View {
        VStack(spacing : 48){
            VStack {
                Text("My location \(location.lastLocation?.coordinate.latitude ?? 0)")
                Text("Permission status: \(location.statusString)")
                Button(action: {
                    location.useLocation()
                }, label: {
                    Text("Ami koi?")
                })
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(LocationRoot())
}
