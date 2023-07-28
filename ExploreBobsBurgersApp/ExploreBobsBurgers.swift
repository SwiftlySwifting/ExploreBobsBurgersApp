//
//  ExploreBobsBurgersAppApp.swift
//  ExploreBobsBurgersApp
//
//  Created by Scriffles on 7/27/23.
//

import SwiftUI

@main
struct ExploreBobsBurgers: App {
    
    @StateObject private var vm = ViewModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SwitchContainerView()
                .environmentObject(vm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
