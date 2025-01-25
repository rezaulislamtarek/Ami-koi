//
//  TaskManager.swift
//  Ami koi
//
//  Created by Rezaul Islam on 25/1/25.
//

import CoreData
import CoreLocation

class TaskManager {
    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func fetchTasks() -> [MyTask] {
        let fetchRequest: NSFetchRequest<MyTask> = MyTask.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch tasks: \(error)")
            return []
        }
    }
}
