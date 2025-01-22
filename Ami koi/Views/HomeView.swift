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
                    Image(systemName: "lightbulb.max")
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

struct WhereAmIView: View {
    @StateObject private var location : LocationRoot = LocationRoot()
    var body: some View {
        VStack{
            VStack{
                if let address = location.address {
                    HStack {
                        Text("I am at \n\(address)")
                        Spacer()
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    }
                        
                }else{
                    Text("")
                         
                }
            }
            .font(.callout)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 120)
            .background(.green.opacity( location.address == nil ? 0 : 0.05))
            .cornerRadius(25)
             
            Button(action: {
                location.fetchLocation()
            }, label: {
                GradientText(text: "Where am I?", gradientColors: [.green, .blue], font: .system(.title2, design: .rounded), fontWeight: .bold)
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    
            })
            .buttonStyle(.bordered)
            .tint(.green.opacity(0.5))
             
        }
    }
}

struct GreetingView: View {
    var body: some View {
        VStack(alignment: .leading ){
            Text("Hi Reza,")
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
