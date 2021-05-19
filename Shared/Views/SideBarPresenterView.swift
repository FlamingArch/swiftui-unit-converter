//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

struct SidebarPresenterView: View {
    
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: LengthView()) {
                    HStack {
                        Image(systemName: "ruler")
                        Text("Length")
                    }
                }
                
                NavigationLink(destination: VolumeView()) {
                    HStack {
                        Image(systemName: "cube")
                        Text("Volume")
                    }
                }
                
                NavigationLink(destination: TemperatureView()) {
                    HStack {
                        Image(systemName: "thermometer")
                        Text("Temperature")
                    }
                }
                
                NavigationLink(destination: TimeView()) {
                    HStack {
                        Image(systemName: "clock")
                        Text("Time")
                    }
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Unit Converter")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SidebarPresenterView()
//    }
//}
