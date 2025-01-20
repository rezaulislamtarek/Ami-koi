//
//  HomeView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 19/1/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var location : LocationRoot = LocationRoot()
    private var quoteProvider = QuoteProvider()
    
    var body: some View {
        VStack(spacing : 48){
            VStack {
                VStack(alignment: .leading ){
                    Text("Hi Reza,")
                    Text(TimeOfDayGreetings.getGreeting().rawValue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Spacer()
                
                if let  address = location.address {
                    Text("I am at \(address)")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                VStack(spacing : 16){
                    Text("\(quoteProvider.getRandomQuote(for: .getGreeting())!)")
                    Image(systemName: "quote.opening")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(.green.opacity(0.05))
                .cornerRadius(24)
                Spacer()
                Button(action: {
                    location.useLocation()
                }, label: {
                    Text("Where am I?")
                        .frame(maxWidth: .infinity)
                        .padding()
                })
                .buttonStyle(.bordered)
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(LocationRoot())
}
