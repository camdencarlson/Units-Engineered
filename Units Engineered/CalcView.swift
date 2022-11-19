//
//  CalcView.swift
//  Units Engineered
//
//  Created by Barry Carlson on 11/14/22.
//

import SwiftUI

struct CalcView: View {
    @State var viewModel: UnitsSession
    @FocusState private var keyboardFocused: Bool
    @Binding var customView: Bool
    
    var body: some View {
        VStack {
            Text(viewModel.selectionUnit)
            Button(action: {
                customView = !customView
            }, label: {
                Text("Custom Units")
            })
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
                Picker("Select Unit", selection: viewModel.selectionUnitBind) { // unit selector
                    ForEach(viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0], id:\.self) {
                        Text($0).tag($0)
                    }
                }
                //Text("Inches: ")
                LazyVStack {
                    TextField("User Input", text: $viewModel.input) // user input
                        .focused($keyboardFocused)
                        .padding()
                        .keyboardType(.decimalPad)
                    .onAppear(perform: {keyboardFocused = true})
                }
            }
            // End of Unit selector and input
        } // End of entire VStack
        .padding()
    } // End of body
}

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
    var output: [UnitOutput]
    var body: some View {
        ForEach(output, id: \.self) { out in
            Text(out.valOfUnit)
                .foregroundColor(Color(UIColor.systemBackground))
                .colorInvert()
                .frame(height: 18)
                .font(.system(size: 23))
                
        }
    }
}

