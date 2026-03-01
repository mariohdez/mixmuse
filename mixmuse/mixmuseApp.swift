//
//  mixmuseApp.swift
//  mixmuse
//
//  Created by Mario Hernandez on 2/28/26.
//

import SwiftData
import SwiftUI

@main
struct mixmuseApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self
        ])
        #if DEBUG
            let isDev = true
        #else
            let isDev = false
        #endif
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: isDev
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
