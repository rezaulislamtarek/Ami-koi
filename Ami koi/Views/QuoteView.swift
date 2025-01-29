//
//  QuoteView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 1/29/25.
//

import SwiftUI

struct QuoteView: View {
    private var quoteProvider = QuoteProvider()
    @State private var quoteRenderToggle : Bool = false
    var body: some View {
        VStack(spacing : 16){
            if quoteRenderToggle{
                Text("\(quoteProvider.getRandomQuote(for: .getGreeting())!)")
            }else{
                Text("\(quoteProvider.getRandomQuote(for: .getGreeting())!)")
            }
            Image(systemName: "quote.opening")
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        
        .font(.system(.title2, design: .some(.serif)))
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .padding(.vertical, 44)
        .background(
            LinearGradient(colors: [.green.opacity(1), .blue.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(24)
        .onTapGesture {
            withAnimation {
                quoteRenderToggle.toggle()
            }
        }
    }
}


#Preview {
    QuoteView()
}
