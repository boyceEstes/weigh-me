//
//  WeighMeApp.swift
//  Shared
//
//  Created by Boyce Estes on 2/4/22.
//

import SwiftUI

@main
struct WeighMeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
