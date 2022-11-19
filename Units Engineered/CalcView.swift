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
    @Binding var unitStringValue: String
    
    var selectionUnitBind: Binding<String> {
        Binding {
            if !viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0].contains(viewModel.selectionUnit) {
                return viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0][0]
            } else {
                return viewModel.selectionUnit
            }
        } set: {
            if !viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0].contains($0) {
                viewModel.selectionUnit = viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0][0]
            } else {
                viewModel.selectionUnit = $0
            }
            
        }
    }
    
    var body: some View {
        VStack {
            
            Button(action: {
                customView = !customView
            }, label: {
                Text("Custom Units")
            })
            .padding(.all, 2)
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
                    
                    
                    VStack(alignment: .trailing) { // Values text boxes
                        ValueView(output: viewModel.output())
                    }
                }
            }
            .padding()
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.all, 2)
            // End of Answer platform/area

            // Measurement selector
            HStack {
                Spacer()
                ZStack {
                    HStack(alignment: .center) {
                        Menu {
                            Picker("Select Measurement", selection: $viewModel.selection) {
                                ForEach(viewModel.options, id: \.self) {
                                    Text($0)
                                }
                                .pickerStyle(.menu)
                            }
                            
                        } label: {
                            Text(viewModel.selection)
                        }
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    .font(.title2)
                    
                }
               
                Spacer()
            }
            .padding(.all, 2)
            
            // End of Measurement selector
            
            // Specific units and input
            HStack(alignment: .center) {
                VStack {
                    
                    Picker("Select Unit", selection: selectionUnitBind) { // unit selector
                        ForEach(viewModel.units[viewModel.options.firstIndex(of: viewModel.selection) ?? 0], id:\.self) {
                            Text($0).tag($0)
                        }
                    }
                
                }
                .frame(width: 100, height: 30)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.all, 10)
                
                //Text("Inches: ")
                VStack {
                    TextField("User Input", text: $viewModel.input)
                        .frame(height: 40.0) // user input
                        .focused($keyboardFocused)
                        
                        .keyboardType(.decimalPad)
                    .onAppear(perform: {keyboardFocused = true})
                }
                .padding(.all, 10)
                
                .frame(height: 30)
                
                HStack {
                    Button(action: {
                        if (viewModel.rounder < 13) {
                            viewModel.rounder = viewModel.rounder+1
                        }
                        
                    }, label: {
                        Label("", systemImage: "plus")
                            
                    })
                    .frame(height: 30)
                    Button(action: {
                        if (viewModel.rounder > 2) {
                            viewModel.rounder = viewModel.rounder-1
                        }
                    }, label: {
                        Label("", systemImage: "minus")
                            
                    })
                    .frame(height: 30)
                }
                .font(.title2)
            }
            .padding(.all, 10)
            // End of Unit selector and input
        } // End of entire VStack
        
    } // End of body
}

struct TextView: View {
    var content: [String]
    var body: some View {
        ForEach(content[0..<content.count], id: \.self) { aContent in
            Text(aContent)
                .foregroundColor(Color(UIColor.systemBackground))
                .colorInvert()
                .frame(height: 15)
                .font(.system(size: 20))
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
                .frame(height: 15)
                .font(.system(size: 19))
        }
    }
}

