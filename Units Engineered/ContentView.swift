//
//  ContentView.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var customView: Bool = false
    
    var body: some View {
        
        let viewModel = UnitsSession()
        
        if (customView) {
            CustomView(viewModel: viewModel, customView: $customView)
            
        }
        else {
            CalcView(viewModel: viewModel, customView: $customView)
        }
        
    }
} // End of content view struct

struct TextView: View {
    var content: [String]
    var body: some View {
        ForEach(content[0..<content.count], id: \.self) { aContent in
            Text(aContent)
                .foregroundColor(Color(UIColor.systemBackground))
                .colorInvert()
                .frame(height: 18)
                .font(.system(size: 25))
                
            
        }
    }
}

struct ValueView: View {
    var output: [String]
    var body: some View {
        ForEach(output, id: \.self) { out in
            Text(out)
                .foregroundColor(Color(UIColor.systemBackground))
                .colorInvert()
                .frame(height: 18)
                .font(.system(size: 23))
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
    }
}
