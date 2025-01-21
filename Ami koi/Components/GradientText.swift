//
//  GradientText.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import SwiftUI

struct GradientText: View {
    var text: String
    var gradientColors: [Color] = [.green, .blue]
    var font: Font = .title2
    var fontWeight: Font.Weight = .bold
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(fontWeight)
            .foregroundColor(.clear) // Make the text transparent
            .background(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .mask(
                Text(text)
                    .font(font)
                    .fontWeight(fontWeight)
            )
    }
}

#Preview {
    GradientText(text: "Hello Bangladesh 2.0", gradientColors: [.green, .blue], font: .title, fontWeight: .bold)
}
