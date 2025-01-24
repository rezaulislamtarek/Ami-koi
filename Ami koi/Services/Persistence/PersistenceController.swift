//
//  PersistenceControllerr.swift
//  Ami koi
//
//  Created by Rezaul Islam on 24/1/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container : NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "AmiKoi")
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unreaolved error \(error.userInfo)")
            }
        }
    }
}
