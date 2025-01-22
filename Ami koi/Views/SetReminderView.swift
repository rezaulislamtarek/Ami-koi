//
//  SetReminderView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import SwiftUI

struct SetReminderView: View {
    @EnvironmentObject private var router : Router
    @State private var details : String = ""
    private var corneerRadious : CGFloat = 16
    var body: some View {
        VStack{
                VStack {
                   
                    Button(action: {
                        router.presentSheet(destination: Route.mapSelectionView)
                    }, label: {
                        VStack(alignment: .leading){
                            HStack{
                                Text("Pick a location")
                                Spacer()
                                Image(systemName: "hand.tap")
                            }
                            .font(.title2)
                            Text("Address: \(router.args["location"] )")
                            Text("No location added")
                                .foregroundStyle(.primary.opacity(0.7))
                                
                        }
                        .foregroundStyle(.white)
                        .padding()
                        .gradientBackground([.green, .blue.opacity(0.5)])
                    .cornerRadius(corneerRadious)
                    })
                    .tint(.primary)
                    
                    TextField("Whats should I tell you later?", text: $details)
                        .padding()
                        .lineLimit(5)
                        .frame(minHeight: 120, alignment: .topLeading)
                        .background(.green.opacity(0.1))
                        .cornerRadius(corneerRadious)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Set Reminder")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding()
                            .gradientBackground()
                            .cornerRadius(corneerRadious)
                            .foregroundStyle(.white)
                    }

                        
                }
             
        }
        .padding(32)
        .fontDesign(.serif)
    }
}

#Preview {
    SetReminderView()
}
