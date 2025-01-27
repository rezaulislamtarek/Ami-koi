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
                    Image(systemName: "list.clipboard")
                        .resizable()
                        .foregroundStyle(.white)
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(10)
                        .gradientBackground()
                        .cornerRadius(16)
                        .onTapGesture {
                            router.navigate(to: Route.reminderListView)
                        }
                    
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

#Preview {
    HomeView()
}

 
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
