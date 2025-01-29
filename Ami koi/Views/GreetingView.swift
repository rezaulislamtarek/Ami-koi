//
//  GreetingView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 1/29/25.
//

import SwiftUI

struct GreetingView: View {
    var body: some View {
        VStack(alignment: .leading ){
            Text("Hey you,")
                .bold()
            let greetingText = TimeOfDayGreetings.getGreeting().rawValue
            GradientText(text: greetingText, gradientColors: [.green, .blue], font: .title, fontWeight: .bold)
            
        }
        .font(.title)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


#Preview {
    GreetingView()
}
