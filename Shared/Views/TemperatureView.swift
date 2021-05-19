//
//  TemperatureView.swift
//  swiftui-unit-converter
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var input: String = "0"
    private var foregroundColor : Color {
        Double(input) != nil ? .primary : .red
    }
    
    @State private var unit = 0
    private var units = ["ºC", "ºF", "K"]
    
    private var celsius: Double {
        
        if let value = Double(input) {
            
            switch unit {
            
            case 0:
                return value
                
            case 1:
                return (value - 32) * 5/9
                
            case 2:
                return value - 273.15
                
            default:
                return 0
            }
            
        } else {
            return 0
        }
    }
    
    var body: some View {
        
        Form {
            Section {
                
                TextField("Enter Length", text:$input)
                    .foregroundColor(foregroundColor)
                
                Picker(selection: $unit, label: Text("Unit")) {
                    ForEach(0..<units.count) {
                        Text(units[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
            }
            
            Section {
                
                HStack {
                    Text("Celsius")
                    Spacer()
                    Text("\(celsius) ºC")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Farenheit")
                    Spacer()
                    Text("\( (celsius * 9/5) + 32 ) ºF")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Kelvin")
                    Spacer()
                    Text("\(celsius + 273.15) K")
                        .foregroundColor(.secondary)
                }
                
            }
            
        }
        .navigationTitle("Temperature")
        
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView().previewDevice("iPhone 12")
    }
}
