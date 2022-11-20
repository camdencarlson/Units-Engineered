//
//  CustomView.swift
//  Units Engineered
//
//  Created by Barry Carlson on 11/14/22.
//

import SwiftUI

struct CustomView: View {
    @State var viewModel: UnitsSession
    @Binding var customView: Bool
    var body: some View {
        VStack {
            Button(action: {
                customView = !customView
            }, label: {
                Text("Back")
            })
            Text("Custom unit functionality coming soon.")
        }
        
    }
}

