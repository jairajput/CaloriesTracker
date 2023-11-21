//
//  CaloriesTrackerApp.swift
//  CaloriesTracker
//
//  Created by Jai  on 20/11/23.
//

import SwiftUI

@main
struct CaloriesTrackerApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext , dataController.container.viewContext )
        }
    }
}
