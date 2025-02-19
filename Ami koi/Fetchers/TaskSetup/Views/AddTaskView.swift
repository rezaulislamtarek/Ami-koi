//
//  SetReminderView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 20/1/25.
//

import SwiftUI
import CoreLocation

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject private var router : Router
    @EnvironmentObject private var lms : LocationService
    @State private var details : String = ""
    private var corneerRadious : CGFloat = 16
    
    @State var location : CLLocation? = nil
    
    var body: some View {
        
        VStack{
            VStack {
                locationPickupButtonSection
                taskDetailsEditorSection
                Spacer()
                setTaskButtonSection
            }
            
        }
        .padding(32)
        .fontDesign(.serif)
        .onChange(of: router.args[.location] as? CLLocation) { newValue in
            location = newValue
            lms.fetchAddress(location: newValue!)
        }
        .onDisappear {
            if !router.isInStack(destination: Route.setReminderView) {
                print("Arg Removed from stack")
                router.args[.location] = nil
            }
        }
    }
}

extension AddTaskView{
    private var locationPickupButtonSection : some View{
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
                
                Text( lms.address == nil ?  "No location added" : lms.address!)
                    .foregroundStyle(.primary.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)
            .padding()
            .gradientBackground([.green, .blue.opacity(0.5)])
            .cornerRadius(corneerRadious)
        })
        .tint(.primary)
    }
    
    private var taskDetailsEditorSection : some View{
        TextField("Whats should I tell you later?", text: $details)
            .padding()
            .lineLimit(5)
            .frame(minHeight: 120, alignment: .topLeading)
            .background(.green.opacity(0.1))
            .cornerRadius(corneerRadious)
    }
    
    private var setTaskButtonSection : some View{
        Button {
            let task = MyTask(context: context)
            task.title = details
            task.lat = location?.coordinate.latitude ?? 0
            task.lon = location?.coordinate.longitude ?? 0
            task.isComplite = false
            task.address = lms.address
            try? context.save()
            lms.addGeofence(for: task)
            
            
        } label: {
            Text("Set Task")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding()
                .gradientBackground()
                .cornerRadius(corneerRadious)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    AddTaskView()
        .environmentObject(Router())
        .environmentObject(LocationService())
}
