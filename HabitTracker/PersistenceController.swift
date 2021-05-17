//
//  PersistenceController.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/16/21.
//

import CoreData

struct PersistanceController {
    static let shared = PersistanceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistanceController = {
        let controller = PersistanceController(inMemory: true)
        let viewContext = controller.container.viewContext
        for _ in 0..<5 {
            let activity = Activity(context: viewContext)
            activity.id = UUID()
            activity.name = "Example Habit"
            activity.streak = 0
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return controller
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Main")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // show some error here
            }
        }
    }
}
