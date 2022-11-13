//
//  ContentView.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: UnitsSession
    @FocusState private var keyboardFocused: Bool
    var body: some View {
        
        
        VStack {
            Spacer()
            // Answer platform/area
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300.0, height: 300.0)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .opacity(0)
                
                    
                HStack { // values and units
                    VStack(alignment: .trailing) { // Names of units
                        TextView(content: viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0])
                            
                    }
                    
                    
                    VStack { // Values text boxes
                        ValueView(output: viewModel.output())
                    }
                }
            }
            .padding()
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            // End of Answer platform/area
            
            
                
            // Measurement selector
            HStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150.0, height: 40.0)
                        .foregroundColor(Color(UIColor.systemBackground))
                    Picker("Select Measurement", selection: $viewModel.selection) {
                        ForEach(viewModel.options, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                        
                        //Text("Selected: \(selection)")
                    }
                }
                Spacer()
                Button(action: {
                    if (viewModel.rounder < 13) {
                        viewModel.rounder = viewModel.rounder+1
                    }
                    
                }, label: {
                    Label("", systemImage: "plus")
                })
                Button(action: {
                    if (viewModel.rounder > 2) {
                        viewModel.rounder = viewModel.rounder-1
                    }
                }, label: {
                    Label("", systemImage: "minus")
                })
            }
            
            // End of Measurement selector
            
            // Specific units of the measurement selector and input
            HStack {
                Picker("Select Unit", selection: $viewModel.selectionUnit) { // unit selector
                    ForEach(viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0], id:\.self) {
                        Text($0)
                    }
                }
                //Text("Inches: ")
                TextField("User Input", text: $viewModel.input) // user input
                    .focused($keyboardFocused)
                    .padding()
                    .keyboardType(.decimalPad)
                    .onAppear(perform: {keyboardFocused = true})
            }
            // End of Unit selector and input
        } // End of entire VStack
        .padding()
    } // End of body
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
        let viewModel = UnitsSession()
        ContentView(viewModel: viewModel)
            //.environment(\.colorScheme, .dark)
    }
}
