//
//  EditAddressView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 26/1/25.
//

import SwiftUI

struct EditAddressView: View {
    @Binding var enableAddressEditing : Bool
    @Binding var address : String
    var doneButtonCliked : ()-> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Edit Address Name")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            TextField("Enter new Address", text: $address)
                .padding()
                .background()
                .cornerRadius(16)
            Spacer()
            Button {
                //action(.editAddress(address))
                doneButtonCliked()
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
    }
}

#Preview {
    EditAddressView(enableAddressEditing: .constant(true), address: .constant("Kallyanpur, Dhaka, Bangladesh")){
        
    }
}
