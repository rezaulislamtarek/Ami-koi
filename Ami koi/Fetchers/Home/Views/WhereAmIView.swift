//
//  WhereAmIView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 1/27/25.
//

import SwiftUI

struct WhereAmIView: View {
    @StateObject private var whereAmIVM : WhereAmIViewModel = WhereAmIViewModel()
    var body: some View {
        VStack{
            VStack{
                if let address = whereAmIVM.address {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("I am at")
                                .font(.title2)
                            Text("\(address)")
                                .font(.callout)
                            
                        }
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            .gradientBackground([.green.opacity(0.1), .blue.opacity(0.1) ])
            .cornerRadius(16)
            .fontDesign(.serif)
        }
        .onAppear{
            whereAmIVM.fetchLocation()
        }
    }
}

#Preview {
    WhereAmIView()
}
