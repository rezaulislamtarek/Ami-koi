//
//  RemindersView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import SwiftUI

struct RemindersView: View {
    @EnvironmentObject private var route : Router
    private let cornerRadious : CGFloat = 16
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Image(systemName: "lightbulb.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundColor(.primary.opacity(0.1))
                GradientText(text: "Not yet added any ideas/ tasks, reminders that i can tell you to do based on your location.", font: .callout, fontWeight: .regular)
                    .multilineTextAlignment(.center)
            }
            .padding()
            Spacer()
            Button(action: {
                route.navigate(to: Route.setReminderView)
            }, label: {
                Text("Want to add a Reminder?")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .gradientBackground()
                    .cornerRadius(cornerRadious)
                    .padding()
                    .font(.title2)
                    
                
            })
        }
        .padding(24)
        .fontDesign(.serif)
    }

}

#Preview {
    RemindersView()
        .environmentObject(Router())
}
