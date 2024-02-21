//
//  DataController.swift
//  GetMem
//
//  Created by Polina on 20.02.2024.
//

import Foundation
import CoreData

final class  PersistanceController: ObservableObject{
    @Published var savedEntities: [LikeMems] = []
    private let container: NSPersistentContainer
    private let containerName: String = "FavorityMems"
    private let entityName: String = "LikeMems"

    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: containerName)
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
            self.getMems()
        }
    }
    
    // MARK: PUBLIC
    func add(question: String, image: String) {
        let entity = LikeMems(context: container.viewContext)
        entity.question = question
        entity.imageMem = image
        applyChanges()
        print("Add new entity, all entitie: \(savedEntities)")
        
    }
    
    func deleteMem(offset: IndexSet){
        offset.map { mem in
           savedEntities[mem]
        }.forEach(container.viewContext.delete)
        
        applyChanges()
        print("Delete entity, all entitie: \(savedEntities)")
    }
    
    // MARK: PRIVATE
    private func getMems(){
        let request = NSFetchRequest<LikeMems>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
            
            print("Fetch Entity \(savedEntities)")
        } catch let error {
            print("Error fetching Portfolio Entities. \(error)")
        }
    }
    
    private func saveContext(){
        if container.viewContext.hasChanges{
            do{
                try container.viewContext.save()
                print("Success save")
            }catch{
                print("we could not save the data...")
            }
        }
    }
    
    private func applyChanges() {
        saveContext()
        getMems()
    }
}
