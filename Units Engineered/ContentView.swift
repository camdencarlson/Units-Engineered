//
//  ContentView.swift
//  Units Engineered
//
//  Created by Camden Carlson on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    private let options = ["Acceleration","Angle","Angular Velocity", "Area","Density","Energy","Specific Energy","Force","Heat Capacity", "Length","Mass","Mass Flow","Power","Pressure","Temperature","Thermal Conduction","Time","Velocity","Viscosity (Dynamic)","Viscosity (Kinematic)","Volume","Volumetric Flow"]
    private let units: [[String]] = [["ft/s^2","m/s^2","cm/s^2","gee","mile/hr/s"], ["deg","rad","grad" ,"rev","arcmin","arcsec"], ["RPM","deg/s","rad/s","deg/min","rad/min"],["inch^2","ft^2","cm^2","m^2","mile^2","acre"], ["lbm/inch^3","lbm/ft^3","slug/ft^3","g/ml","specific gravity","kg/m^3","lbm/galUS","ounce/galUS"], ["BTU","ft*lbf","W*hr","kW/hr","cal","kcal","J","kJ"], ["BTU/lbm","cal/g","kcal/g","kcal/kg","J/g","kJ/kg","kW*hr/kg"], ["lbf","N","kN"], ["BTU/lbm/dF","cal/g/dC","kcal/g/dC","J/kg/dK","kJ/kg/dK"], ["inch", "thou","ft","yd","mm","cm","m","km","mile","nautical mile","angstrom","astronomical unit", "light year"], ["lbm", "slug","g","kg","metric ton","short ton","long ton","gal H2O"], ["lbm/s","kg/s","g/s","lbm/min","kg/min","g/min","lbm/hr","kg/hr","g/hr"], ["HP","BTU/s","BTU/hr","cal/s","W","kW","MW","ft*lbf/s"], ["psai","atm","MPa","kPa","Pa","psf","bar","torr","inHg","mmHg","lbf/inch^2","lbf/ft^2","N/cm^2","N/m^2"], ["degR","degF"], ["BTU/hr/ft/dF", "BTU/s/inch/dF"], ["s","ms","microsec","nanosec","min","hr","day","year"], ["ft/s","inch/s","cm/s","m/s","km/hr","mph"], ["poise","cpoise","lbm/s/inch","lbm/hr/inch","lbm/s/ft","lbm/hr/ft","kg/s/m","kg/hr/m","kg/s/cm","kg/hr/cm"], ["ft^2/s","ft^2/hr","stokes","centistokes","m^2/s"], ["inch^3","ft^3","cm^3","liter","m^3","yd^3","barOil","cup","pint","quart","galUS","galUK"], ["inch^3/s","inch^3/min","inch^3/hr","ft^3/s","ft^3/min","ft^3/hr","ml/s","ml/min","ml/hr","m^3/s","l/s","galUS/s","galUS/min","galUS/hr","galUS/day"]]
    private let ratios: [[Double]] = [[1,0.3048,30.48,0.03108095,0.6818181818],
                                      [1,Double.pi/180, 1.1111111111, 0.0027777778,60,3600],
                                      [1,6,Double.pi/30, 360,Double.pi*2],
                                      [1,0.006944444,6.4516,0.00064516,0.0000000002491, 0.00000015942],
                                      [1,1728,53.70787949,27.67990471,27.67990471,27679.90471, 231, 3696],
                                      [1,778.1692623,0.2930710702,0.0002930710702,252.1644007,0.2521644007,1055.055853,1.055055853],
                                      [1,0.5559273423,0.0005559273423,0.5559273423,2.326,2.326, 0.0006461111111],
                                      [1,4.448221615, 0.004448221615],
                                      [1,1.000669216, 0.001000669216, 4186.8,4.1868],
                                      [1, 1000, 0.083333, 0.0277778, 25.4, 2.54, 0.0254, 0.0000158, 0.0000137,0.0000000254, 0, 0, 0],
                                      [1, 0.03108094878, 453.59237, 0.45359237, 0.00045359237, 0.0005, 0.0004464285714, 0.1200480192],
                                      [1,0.45359237, 453.59237, 60, 27.2155422, 27215.5422, 3600, 1632.932532, 1632932.532],
                                      [1,0.7067872266, 2544.434016,178.2265774,745.7,0.7457, 0.0007457, 550.0000947],
                                      [1,0.06804596391,0.006894757293,6.894757293,6894.757293,144,0.06894757293, 51.71493257, 2.036021, 51.71493, 1, 144, 0.6894757293, 6894.757293],
                                      [0,0],
                                      [0,0],
                                      [1,1000,1000000, 1000000000, 0.0166666667,0.0002777778,0.000011574074,0.000000031709792],
                                      [1,12,30.48,0.3048,1.09728,0.6818181818],
                                      [1,100,0.00559974146,20.15906925,0.06719689751, 241.9088311,0.1,360,0.001,3.6],
                                      [1,3600,929.0304, 92903.04, 0.09290304],
                                      [1,0.0005787037037, 16.387064, 0.016387064,0.000016387064, 0.00002143347051, 0.0001030715316, 0.06926406926, 0.03463203463, 0.01731601732, 0.004329004329,0.00360465015],
                                      [1,60,3600,0.0005787037,0.034722222222,2.0833333333,16.387064,983.22384,58933.4303, 0.000016387064, 0.016387064,0.004329004329, 0.2597402597, 15.58441558,374.025974]]
    
    @State var input = ""
    @State var answer = "0"
    @State var vals:[[Double]] = [[1,0.3048,30.48,0.03108095,0.6818181818],
                                  [1,Double.pi/180, 1.1111111111, 0.0027777778,60,3600],
                                  [1,6,Double.pi/30, 360,Double.pi*2],
                                  [1,0.006944444,6.4516,0.00064516,0.0000000002491, 0.00000015942],
                                  [1,1728,53.70787949,27.67990471,27.67990471,27679.90471, 231, 3696],
                                  [1,778.1692623,0.2930710702,0.0002930710702,252.1644007,0.2521644007,1055.055853,1.055055853],
                                  [1,0.5559273423,0.0005559273423,0.5559273423,2.326,2.326, 0.0006461111111],
                                  [1,4.448221615, 0.004448221615],
                                  [1,1.000669216, 0.001000669216, 4186.8,4.1868],
                                  [1, 1000, 0.083333, 0.0277778, 25.4, 2.54, 0.0254, 0.0000158, 0.0000137,0.0000000254, 0, 0, 0],
                                  [1, 0.03108094878, 453.59237, 0.45359237, 0.00045359237, 0.0005, 0.0004464285714, 0.1200480192],
                                  [1,0.45359237, 453.59237, 60, 27.2155422, 27215.5422, 3600, 1632.932532, 1632932.532],
                                  [1,0.7067872266, 2544.434016,178.2265774,745.7,0.7457, 0.0007457, 550.0000947],
                                  [1,0.06804596391,0.006894757293,6.894757293,6894.757293,144,0.06894757293, 51.71493257, 2.036021, 51.71493, 1, 144, 0.6894757293, 6894.757293],
                                  [0,0],
                                  [0,0],
                                  [1,1000,1000000, 1000000000, 0.0166666667,0.0002777778,0.000011574074,0.000000031709792],
                                  [1,12,30.48,0.3048,1.09728,0.6818181818],
                                  [1,100,0.00559974146,20.15906925,0.06719689751, 241.9088311,0.1,360,0.001,3.6],
                                  [1,3600,929.0304, 92903.04, 0.09290304],
                                  [1,0.0005787037037, 16.387064, 0.016387064,0.000016387064, 0.00002143347051, 0.0001030715316, 0.06926406926, 0.03463203463, 0.01731601732, 0.004329004329,0.00360465015],
                                  [1,60,3600,0.0005787037,0.034722222222,2.0833333333,16.387064,983.22384,58933.4303, 0.000016387064, 0.016387064,0.004329004329, 0.2597402597, 15.58441558,374.025974]]
    @State var textviewCount = 0;
    @State var valCount = 0;
    @State var selection = "Length"
    @State var selectionUnit = "Inch"
    
    var body: some View {
        
        let binding = Binding<String>(get: {
            self.input
        }, set: {
            self.input = $0
        })
        VStack {
            // Answer platform/area
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300.0, height: 300.0)
                    .foregroundColor(Color(UIColor.systemBackground))
                HStack { // values and units
                    VStack { // Names of units
                        TextView(content: units[options.firstIndex(of: selection) ?? 0])
                    }
                    VStack { // Values text boxes
                        ValueView(selectedIndex: options.firstIndex(of: selection) ?? 0, ratios: ratios, units: units, vals: vals, selectionUnit: selectionUnit)
                    }
                }
            }
            // End of Answer platform/area
            
            Spacer()
                
            // Measurement selector
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150.0, height: 70.0)
                    .foregroundColor(Color(UIColor.systemBackground))
                Picker("Select Measurement", selection: $selection) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                    .pickerStyle(.menu)
                    //Text("Selected: \(selection)")
                }
            }
            // End of Measurement selector
            
            // Specific units of the measurement selector and input
            HStack {
                Picker("Select Unit", selection: $selectionUnit) { // unit selector
                    ForEach(units[options.firstIndex(of: selection) ?? 0], id:\.self) {
                        Text($0)
                    }
                }
                //Text("Inches: ")
                TextField("User Input", text: binding) // user input
                    .padding()
                    .keyboardType(.decimalPad)
            }
            // End of Unit selector and input
            
            // Go button - calculation happens here
            Button("Go", action: {
                valCount = 0
                for _ in self.vals[options.firstIndex(of: selection) ?? 0] {
                    vals[options.firstIndex(of: selection) ?? 0][valCount] = (Double(input) ?? 0) * ratios[options.firstIndex(of: selection) ?? 0][valCount]
                    valCount = valCount+1
                }
                valCount = 0
            })
            .foregroundColor(Color(UIColor.systemBackground))
            .colorInvert()
            
            // End of go button
        } // End of entire VStack
        
        .padding()
        
    } // End of body
} // End of content view struct

struct TextView: View {
    var content: [String]
    var body: some View {
        ForEach(content[0..<content.count], id: \.self) { aContent in
            Text(aContent)
                .frame(height: 15)
        }
    }
}

struct ValueView: View {
    var selectedIndex: Int
    var ratios: [[Double]]
    var units: [[String]]
    var vals: [[Double]]
    var selectionUnit: String
    var body: some View {
        ForEach(vals[selectedIndex].map{$0 / ratios[selectedIndex][units[selectedIndex].firstIndex(of: selectionUnit) ?? 0]}, id: \.self) { val in
            Text(String(val))
                .frame(height: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.colorScheme, .dark)
    }
}
