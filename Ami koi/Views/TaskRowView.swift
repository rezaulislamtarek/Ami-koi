//
//  TaskRowView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 24/1/25.
//

import SwiftUI

struct TaskRowView: View {
    let title : String
    let address : String
    @State var isComplited : Bool
    var action : (TaskAction)-> Void
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading, spacing: 8, content: {
                Text(title)
                    .font(.title2)
                Text(address)
                    .font(.callout)
            })
            Spacer()
            Image(systemName: isComplited ? "checkmark.square.fill" : "square")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(.green)
                .onTapGesture {
                    isComplited.toggle()
                    action(.checkUncheck(isComplited))
                }
                .padding(.vertical)
        }
        .padding()
        .gradientBackground([ .green.opacity(0.1), .accentColor.opacity(0.1)])
        .fontDesign(.serif) 
         
    }
}

enum TaskAction{
    case checkUncheck(Bool)
    case editTitle
}

#Preview {
    TaskRowView(title: "Need to buy a computer", address: "IDB Bhobon, Agargong, Dhaka, Bangladesh", isComplited: true){ action in }
}
