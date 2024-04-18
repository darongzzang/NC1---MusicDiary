//
//  NC1_testApp.swift
//  NC1-test
//
//  Created by 김이예은 on 4/14/24.
//

import SwiftUI
import SwiftData

@main
struct NC1_testApp: App {
    var sharedModelContainer: ModelContainer = {
    
        let schema = Schema([
            SelectedSong.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            print("ruler")
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(sharedModelContainer)
    }
}

