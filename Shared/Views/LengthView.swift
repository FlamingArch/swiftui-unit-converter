//
//  LengthView.swift
//  swiftui-unit-converter
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

struct LengthView: View {
    
    @State private var input: String = "0"
    private var foregroundColor : Color {
        Double(input) != nil ? .primary : .red
    }
    
    @State private var unit = 0
    private var units = ["M", "KM", "FT", "ML", "YD"]
    
    private var meters: Double {
        
        if let value = Double(input) {
            
            switch unit {
            
            case 0:
                return value
                
            case 1:
                return value * 1000
                
            case 2:
                return value / 3.281
                
            case 3:
                return value * 1609.34
                
            case 4:
                return value / 1.094
                
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
                    Text("Meter")
                    Spacer()
                    Text("\(meters)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Kilometer")
                    Spacer()
                    Text("\(meters / 1000)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Feet")
                    Spacer()
                    Text("\(meters * 3.281)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Mile")
                    Spacer()
                    Text("\(meters / 1609.34)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Yard")
                    Spacer()
                    Text("\(meters * 1.094)").foregroundColor(.secondary)
                }
                
            }
            
        }
        .navigationTitle("Length")
        
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView().previewDevice("iPhone 12")
    }
}
