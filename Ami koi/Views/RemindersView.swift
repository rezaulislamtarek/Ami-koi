//
//  RemindersView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import SwiftUI
import CoreData

struct RemindersView: View {
    @EnvironmentObject private var locationManagerService : LocationManagerService
    @EnvironmentObject private var router : Router
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MyTask.isComplite, ascending: true)],
        animation: .default
    )  var tasks: FetchedResults<MyTask>
    private let cornerRadious : CGFloat = 16
    
    var body: some View {
        VStack{
            if !tasks.isEmpty{
                taskListSection
            }
            Spacer()
            if tasks.isEmpty{
                NoTaskView()
            }
            Spacer()
            Button(action: {
                router.navigate(to: Route.setReminderView)
            }, label: {
                Text("Want to add a Reminder?")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .gradientBackground()
                    .cornerRadius(cornerRadious)
                    .foregroundStyle(.white)
                    
                
            })
        }
        .padding(24)
        .fontDesign(.serif)
    }
    
    
    private func deleteTask(at offsets: IndexSet) {
            withAnimation {
                offsets.map {
                    tasks[$0] }.forEach{ task in
                        locationManagerService.removeGeofence(for: task)
                        context.delete(task)
                    }

                do {
                     
                    try context.save() // Save after deletion
                } catch {
                    let nsError = error as NSError
                    print("Error deleting task: \(nsError), \(nsError.userInfo)")
                }
            }
        }
    

}

extension RemindersView{
    private var taskListSection : some View{
        List{
            ForEach(tasks){ task in
                TaskRowView(title: task.title ?? "", address: task.address ?? "", isComplited: task.isComplite) { action in
                    switch action {
                    case .checkUncheck(let value):
                        task.isComplite = value
                        print("\(value)")
                        try? context.save()
                    case .editAddress(let value):
                        print("Edit title")
                        task.address = value
                        try? context.save()
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .cornerRadius(cornerRadious)
                .padding(.vertical, 4)
            }
            .onDelete(perform: { indexSet in
                deleteTask(at: indexSet)
            })
             
        }
        .listRowSeparator(.hidden)
        .listStyle(.plain)
        .listRowInsets(EdgeInsets())
    }
}


#Preview {
    RemindersView()
        .environmentObject(Router())
}


