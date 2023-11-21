//
//  DataController.swift
//  CaloriesTracker
//
//  Created by Jai  on 21/11/23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc , error in
            if let error = error {
                print("Failed to load Data\(error.localizedDescription)")
            }
            
        }
    }
    func save(context:NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Data Not Saved")
        }
    }
    func addfood(name:String , calories:Double , context:NSManagedObjectContext){
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
    func editFood(food: Food , name:String , calories:Double , context:NSManagedObjectContext){
        food.date = Date()
        food.name = name
        food.calories = calories
        
        
        save(context: context)
    }
}
