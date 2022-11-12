//
//  UnitsSession.swift
//  Units Engineered
//
//  Created by Barry Carlson on 11/11/22.
//

import Foundation

struct UnitsSession {
    
    let options = ["Acceleration","Angle","Angular Velocity", "Area","Density","Energy","Specific Energy","Force","Heat Capacity", "Length","Mass","Mass Flow","Power","Pressure","Temperature","Thermal Conduction","Time","Velocity","Viscosity (Dynamic)","Viscosity (Kinematic)","Volume","Volumetric Flow"]
    let units: [[String]] = [["ft/s^2","m/s^2","cm/s^2","gee","mile/hr/s"], ["deg","rad","grad" ,"rev","arcmin","arcsec"], ["RPM","deg/s","rad/s","deg/min","rad/min"],["inch^2","ft^2","cm^2","m^2","mile^2","acre"], ["lbm/inch^3","lbm/ft^3","slug/ft^3","g/ml","specific gravity","kg/m^3","lbm/galUS","ounce/galUS"], ["BTU","ft*lbf","W*hr","kW/hr","cal","kcal","J","kJ"], ["BTU/lbm","cal/g","kcal/g","kcal/kg","J/g","kJ/kg","kW*hr/kg"], ["lbf","N","kN"], ["BTU/lbm/dF","cal/g/dC","kcal/g/dC","J/kg/dK","kJ/kg/dK"], ["inch", "thou","ft","yd","mm","cm","m","km","mile","nautical mile","angstrom","astronomical unit", "light year"], ["lbm", "slug","g","kg","metric ton","short ton","long ton","gal H2O"], ["lbm/s","kg/s","g/s","lbm/min","kg/min","g/min","lbm/hr","kg/hr","g/hr"], ["HP","BTU/s","BTU/hr","cal/s","W`","kW","MW","ft*lbf/s"], ["psai","atm","MPa","kPa","Pa","psf","bar","torr","inHg","mmHg","lbf/inch^2","lbf/ft^2","N/cm^2","N/m^2"], ["degR","degF","degK","degC"], ["BTU/hr/ft/dF", "BTU/s/inch/dF"], ["s","ms","microsec","nanosec","min","hr","day","year"], ["ft/s","inch/s","cm/s","m/s","km/hr","mph"], ["poise","cpoise","lbm/s/inch","lbm/hr/inch","lbm/s/ft","lbm/hr/ft","kg/s/m","kg/hr/m","kg/s/cm","kg/hr/cm"], ["ft^2/s","ft^2/hr","stokes","centistokes","m^2/s"], ["inch^3","ft^3","cm^3","liter","m^3","yd^3","barOil","cup","pint","quart","galUS","galUK"], ["inch^3/s","inch^3/min","inch^3/hr","ft^3/s","ft^3/min","ft^3/hr","ml/s","ml/min","ml/hr","m^3/s","l/s","galUS/s","galUS/min","galUS/hr","galUS/day"]]
    let ratios: [[Double]] = [[1,0.3048,30.48,0.03108095,0.6818181818], // acceleration
                                      [1,Double.pi/180, 1.1111111111, 0.0027777778,60,3600], // angle
                                      [1,6,Double.pi/30, 360,Double.pi*2], // angular velo
                                      [1,0.006944444,6.4516,0.00064516,0.0000000002491, 0.00000015942],//area
                                      [1,1728,53.70787949,27.67990471,27.67990471,27679.90471, 231, 3696],//density
                                      [1,778.1692623,0.2930710702,0.0002930710702,252.1644007,0.2521644007,1055.055853,1.055055853], // energy
                                      [1,0.5559273423,0.0005559273423,0.5559273423,2.326,2.326, 0.0006461111111],// specific energy
                                      [1,4.448221615, 0.004448221615],//force
                                      [1,1.000669216, 0.001000669216, 4186.8,4.1868],//heat capacity
                                      [1, 1000, 0.083333, 0.0277778, 25.4, 2.54, 0.0254, 0.0000158, 0.0000137,0.0000000254, 0, 0, 0],//length
                                      [1, 0.03108094878, 453.59237, 0.45359237, 0.00045359237, 0.0005, 0.0004464285714, 0.1200480192],//mass
                                      [1,0.45359237, 453.59237, 60, 27.2155422, 27215.5422, 3600, 1632.932532, 1632932.532],//mass flow
                                      [1,0.7067872266, 2544.434016,178.2265774,745.7,0.7457, 0.0007457, 550.0000947],//power
                                      [1,0.06804596391,0.006894757293,6.894757293,6894.757293,144,0.06894757293, 51.71493257, 2.036021, 51.71493, 1, 144, 0.6894757293, 6894.757293],//pressure
                              [1.8,1.8,1,1], // temperature
                                      [0,0], // thermal conduction
                                      [1,1000,1000000, 1000000000, 0.0166666667,0.0002777778,0.000011574074,0.000000031709792],//time
                                      [1,12,30.48,0.3048,1.09728,0.6818181818],//velocity
                                      [1,100,0.00559974146,20.15906925,0.06719689751, 241.9088311,0.1,360,0.001,3.6],//viscosity dynamic
                                      [1,3600,929.0304, 92903.04, 0.09290304],//viscosity kinematic
                                      [1,0.0005787037037, 16.387064, 0.016387064,0.000016387064, 0.00002143347051, 0.0001030715316, 0.06926406926, 0.03463203463, 0.01731601732, 0.004329004329,0.00360465015],//volume
                                      [1,60,3600,0.0005787037,0.034722222222,2.0833333333,16.387064,983.22384,58933.4303, 0.000016387064, 0.016387064,0.004329004329, 0.2597402597, 15.58441558,374.025974]] //volume flow
    var selection = "Length"
    var selectionUnit = "inch"
    var rounder = 2
    
    var input = ""
    
    func output() -> [String] {
        var roundNum = Double(1)
        for _ in 1...rounder-1 {
            roundNum = roundNum * 10
        }
        
        
        var output = [String](repeating: "", count: ratios[options.firstIndex(of: selection) ?? 0].count)
        var counter = 0;
        for _ in output {
            if selection == "Temperature" {
//                let ratioIndex = options.firstIndex(of: "Temperature") ?? 0
//                let ratioIndexUnit = units[options.firstIndex(of: "Temperature") ?? 0].firstIndex(of: selectionUnit) ?? 0
//                if (counter == 0 || counter == 2) && (ratioIndexUnit == 0 || ratioIndexUnit == 2) {
//                    output[counter] = String(round((Double(input) ?? 0) * ratios[ratioIndex][counter] / ratios[ratioIndex][ratioIndexUnit] * roundNum) / roundNum)
//                }
                switch selectionUnit {
                case "degF":
                    output[0] = String(round(((Double(input) ?? 0) + Double(459.67)) * roundNum) / roundNum)
                    output[1] = String(round((Double(input) ?? 0)  * roundNum) / roundNum)
                    output[2] = String(round(((Double(input) ?? 0) + Double(459.67)) / Double(1.8) * roundNum) / roundNum)
                    output[3] = String(round((((Double(input) ?? 0) + Double(459.67)) / Double(1.8) - Double(273.15)) * roundNum) / roundNum)
                case "degC":
                    output[0] = String(round(((Double(input) ?? 0) + Double(273.15)) / Double(1.8) * roundNum) / roundNum)
                    output[1] = String(round((((Double(input) ?? 0) + Double(273.15)) / Double(1.8) - Double(459.67)) * roundNum ) / roundNum)
                    output[2] = String(round(((Double(input) ?? 0) + Double(273.15)) * roundNum) / roundNum)
                    output[3] = String(round((Double(input) ?? 0) * roundNum) / roundNum)
                case "degK":
                    output[0] = String(round((Double(input) ?? 0) * Double(1.8) * roundNum) / roundNum)
                    output[1] = String(round(((Double(input) ?? 0) * Double(1.8) - Double(459.67)) * roundNum) / roundNum)
                    output[2] = String(round(((Double(input) ?? 0) - Double(273.15)) * roundNum) / roundNum)
                    output[3] = String(round((Double(input) ?? 0) * roundNum) / roundNum)
                default:
                    output[0] = String(round((Double(input) ?? 0) * roundNum) / roundNum)
                    output[1] = String(round(((Double(input) ?? 0) - Double(459.67)) * roundNum) / roundNum)
                    output[2] = String(round((Double(input) ?? 0) / Double(1.8) * roundNum) / roundNum)
                    output[3] = String(round(((Double(input) ?? 0) / Double(1.8) - Double(273.15)) * roundNum) / roundNum)
                    
                }
                
            }
            else {
                let ratioIndex = options.firstIndex(of: selection) ?? 0
                let ratioIndexUnit = units[options.firstIndex(of: selection) ?? 0].firstIndex(of: selectionUnit) ?? 0
                output[counter] = String(round((Double(input) ?? 0) * ratios[ratioIndex][counter] / ratios[ratioIndex][ratioIndexUnit] * roundNum) / roundNum)
                
            }
            counter = counter + 1
        }
        return output
    }

}

