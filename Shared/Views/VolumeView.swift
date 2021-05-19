//
//  VolumeView.swift
//  swiftui-unit-converter
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

struct VolumeView: View {
    
    @State private var input: String = "0"
    private var foregroundColor : Color {
        Double(input) != nil ? .primary : .red
    }
    
    @State private var unit = 0
    private var units = ["ML", "L", "PT", "GAL", "OZ", "C"]
    
    private var mililiters: Double {
        
        if let value = Double(input) {
            
            switch unit {
            
            case 0:
                return value
                
            case 1:
                return value * 1000
                
            case 2:
                return value * 473.176
                
            case 3:
                return value * 3785.41
                 
            case 4:
                return value * 29.57
                
            case 5:
                return value * 236.59
                
            default:
                return 0
            }
            
        } else {
            return 0
        }
    }
    
    var body: some View {
        
        Form {
            Section(footer: Text("Assumes 30 days in a month")) {
                
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
                    Text("Mililiters")
                    Spacer()
                    Text("\(mililiters)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Liters")
                    Spacer()
                    Text("\(mililiters / 1000)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Pints")
                    Spacer()
                    Text("\(mililiters / 473.176)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Gallon")
                    Spacer()
                    Text("\(mililiters / 3785.41)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Fluid Ounces")
                    Spacer()
                    Text("\(mililiters / 29.57)").foregroundColor(.secondary)
                }
                
                
                HStack {
                    Text("Cups")
                    Spacer()
                    Text("\(mililiters / 236.59)").foregroundColor(.secondary)
                }
                
            }
            
        }
        .navigationTitle("Length")
        
    }
}



