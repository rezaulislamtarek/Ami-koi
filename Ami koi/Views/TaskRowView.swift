//
//  TaskRowView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 24/1/25.
//

import SwiftUI

struct TaskRowView: View {
    let title : String
    @State var address : String = ""
    @State var isComplited : Bool
    var action : (TaskAction)-> Void
    @State private var enableAddressEditing : Bool = false
    
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading, spacing: 8, content: {
                Text(title)
                    .font(.title2)
                HStack(alignment:.top){
                    Text(address)
                        
                    Button(action: {
                        enableAddressEditing = true
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.green)
                            .padding(.top, 3)
                    })
                        
                }
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
                .padding(.vertical, 4)
        }
        .padding()
        .gradientBackground([ .green.opacity(0.1), .accentColor.opacity(0.1)])
        .fontDesign(.serif) 
        .sheet(isPresented: $enableAddressEditing, content: {
            VStack(alignment: .leading, spacing: 16){
                Text("Edit Address Name")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                TextField("Enter new Address", text: $address)
                    .padding()
                    .background()
                    .cornerRadius(16)
                Spacer()
                Button {
                    action(.editAddress(address))
                    enableAddressEditing.toggle()
                } label: {
                    Text("Done")
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .gradientBackground()
                        .cornerRadius(16)
                }

            }
            .presentationDetents([.height(300)])
            .fontDesign(.serif)
            .padding()
            .padding(.vertical)
            .gradientBackground([.green.opacity(0.1), .blue.opacity(0.1)])
            
            
            
        })
         
    }
}

enum TaskAction{
    case checkUncheck(Bool)
    case editAddress(String)
}

#Preview {
    TaskRowView(title: "Need to buy a computer", address: "IDB Bhobon, Agargong, Dhaka, Bangladesh", isComplited: true){ action in }
}
