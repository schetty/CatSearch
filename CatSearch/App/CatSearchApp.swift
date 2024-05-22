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
    var body: some Scene {
        WindowGroup {
            CatContentView()
        }.modelContainer(for: Cat.self, isAutosaveEnabled: true)
    }
}
