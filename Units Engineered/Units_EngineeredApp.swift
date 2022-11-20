//
//  Units_EngineeredApp.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI
import RevenueCat

@main
struct Units_EngineeredApp: App {
//    let unitsSession = UnitsSession() // reference type doesn't change
    @StateObject var userViewModel = UserViewModel()
    init() {
        setupRevenueCat()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
    
    func setupRevenueCat() {
        Purchases.logLevel  = .debug
        Purchases.configure(withAPIKey: "appl_GhaiJlFXnqFMHJZFKwszJWDbRlW")
        
    }
    
}
