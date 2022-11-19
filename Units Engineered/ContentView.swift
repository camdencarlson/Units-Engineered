//
//  ContentView.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var customView: Bool = false
    @State var unitValue = "inch"
   
    var body: some View {
        
        let viewModel = UnitsSession()
        
        if (customView) {
            CustomView(viewModel: viewModel, customView: $customView)
            
        }
        else {
            CalcView(viewModel: viewModel, customView: $customView, unitStringValue: $unitValue)
        }
        
    }
} // End of content view struct



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
    }
}
