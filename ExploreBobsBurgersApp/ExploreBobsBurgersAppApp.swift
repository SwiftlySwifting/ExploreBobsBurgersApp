//
//  ExploreBobsBurgersAppApp.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

@main
struct ExploreBobsBurgersAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
