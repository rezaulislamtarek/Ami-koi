//
//  View+Extension.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import SwiftUI

extension View {
    func gradientBackground(_ colors : [Color] = [.green, .blue]) -> some View{
        self.background(
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}
