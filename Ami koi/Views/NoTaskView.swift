//
//  NoTaskView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 26/1/25.
//

import SwiftUI

struct NoTaskView: View {
    var body: some View {
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
    }
}

#Preview {
    NoTaskView()
}
