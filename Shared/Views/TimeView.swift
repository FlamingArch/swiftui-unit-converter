//
//  TimeView.swift
//  swiftui-unit-converter
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

struct TimeView: View {
    
    @State private var input: String = "0"
    private var foregroundColor : Color {
        Double(input) != nil ? .primary : .red
    }
    
    @State private var unit = 0
    private var units = ["S", "M", "H", "D", "W", "M", "Y"]
    
    private var seconds: Double {
        
        if let value = Double(input) {
            
            switch unit {
            
            case 0:
                return value
                
            case 1:
                return value * 60
                
            case 2:
                return value * 3600
                
            case 3:
                return value * 86400
                
            case 4:
                return value * 604_800
                
            case 5:
                return value * 2_592_000
                
            case 6:
                return value * 31_104_000
                
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
                    Text("Seconds")
                    Spacer()
                    Text("\(seconds)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Minutes")
                    Spacer()
                    Text("\(seconds / 60)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Hours")
                    Spacer()
                    Text("\(seconds / 3600)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Days")
                    Spacer()
                    Text("\(seconds / 86400)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Weeks")
                    Spacer()
                    Text("\(seconds / 604_800)").foregroundColor(.secondary)
                }
                
                
                HStack {
                    Text("Months")
                    Spacer()
                    Text("\(seconds / 2_592_000)").foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Years")
                    Spacer()
                    Text("\(seconds / 31_104_000)").foregroundColor(.secondary)
                }
                
            }
            
        }
        .navigationTitle("Length")
        
    }
}
