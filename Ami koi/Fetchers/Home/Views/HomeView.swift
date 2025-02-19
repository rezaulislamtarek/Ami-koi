//
//  HomeView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 19/1/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router : Router
    
    var body: some View {
        VStack(spacing : 48){
            VStack {
                HStack {
                    GreetingView()
                    myTaskButtonSetion
                }
                Spacer()
                QuoteView()
                Spacer()
                
            }
            WhereAmIView()
        }
        .padding(24)
    }
}

extension HomeView{
    private var myTaskButtonSetion : some View{
        Button {
            router.navigate(to: Route.reminderListView)
        } label: {
            Image(systemName: "list.clipboard")
                .resizable()
                .foregroundStyle(.white)
                .scaledToFit()
                .frame(width: 30)
                .padding(10)
                .gradientBackground()
                .cornerRadius(16)
        }
    }
}

#Preview {
    HomeView()
}
