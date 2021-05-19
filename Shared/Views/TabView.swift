//
//  TabView.swift
//  swiftui-unit-converter
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

struct TabbedView: View {
    var body: some View {
        NavigationView {
            TabView {
                LengthView()
                    .tabItem {
                        Label("Length", systemImage: "ruler")
                    }
                VolumeView()
                    .tabItem {
                        Label("Volume", systemImage: "cube")
                    }
                TemperatureView()
                    .tabItem {
                        Label("Temperature", systemImage: "thermometer")
                    }
                TimeView()
                    .tabItem {
                        Label("Time", systemImage: "clock")
                    }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
