//
//  RemindersView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//

import SwiftUI
import CoreData

struct RemindersView: View {
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
                ScrollView(showsIndicators: false){
                    ForEach(tasks){ task in
                        TaskRowView(title: task.title ?? "", address: task.address ?? "", isComplited: task.isComplite) { action in
                            switch action {
                            case .checkUncheck(let value):
                                task.isComplite = value
                                print("\(value)")
                                try? context.save()
                            case .editTitle:
                                print("Edit title")
                            }
                        }
                        .cornerRadius(cornerRadious)
                    }
                }
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
                    .foregroundStyle(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .gradientBackground()
                    .cornerRadius(cornerRadious)
                    .padding()
                    .font(.title2)
                    
                
            })
        }
        .padding(24)
        .fontDesign(.serif)
    }

}

#Preview {
    RemindersView()
        .environmentObject(Router())
}

struct NoTaskView: View {
    var body: some View {
        VStack{
            Image(systemName: "lightbulb.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundColor(.primary.opacity(0.1))
            
            GradientText(text: "Not yet added any ideas/ tasks, reminders that i can tell you to do based on your location.", font: .callout, fontWeight: .regular)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
