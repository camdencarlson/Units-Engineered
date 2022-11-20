//
//  Units_EngineeredApp.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI
import Purchases

@main
struct Units_EngineeredApp: App {
//    let unitsSession = UnitsSession() // reference type doesn't change
    init() {
        setupRevenueCat()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func setupRevenueCat() {
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "appl_GhaiJlFXnqFMHJZFKwszJWDbRlW")
        
    }
    
}
