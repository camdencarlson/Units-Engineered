//
//  ContentView.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var customView: Bool = false
    @State var purchaseView: Bool = false
    @State var unitValue = "inch"
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        
        let viewModel = UnitsSession()
        
        if (customView) {
            CustomView(viewModel: viewModel, customView: $customView)
            
        }
        else if (purchaseView) {
            PurchaseView(viewModel: viewModel, purchaseView: $purchaseView)
                .environmentObject(userViewModel)
        }
        else {
            CalcView(viewModel: viewModel, customView: $customView, purchaseView: $purchaseView, unitStringValue: $unitValue)
                .environmentObject(userViewModel)
        }
        
    }
} // End of content view struct



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
    }
}
