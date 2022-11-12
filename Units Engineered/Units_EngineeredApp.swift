//
//  Units_EngineeredApp.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI

@main
struct Units_EngineeredApp: App {
    let unitsSession = UnitsSession() // reference type doesn't change
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: unitsSession)
        }
    }
}
