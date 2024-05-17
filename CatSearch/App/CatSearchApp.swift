//
//  CatSearchApp.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import SwiftUI
import SwiftData

@main
struct CatSearchApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Cat.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CatList(viewModel: CatListViewModel())
        }
        .modelContainer(sharedModelContainer)
    }
}
