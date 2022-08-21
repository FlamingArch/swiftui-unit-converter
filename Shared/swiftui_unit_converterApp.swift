//
//  swiftui_unit_converterApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 19/05/21.
//

import SwiftUI

@main
struct swiftui_unit_converterApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            SidebarPresenterView()
            #else
            if UIDevice.current.userInterfaceIdiom == .phone {
                TabbedView()
            } else {
                SidebarPresenterView()
            }
            #endif
        }
    }
}
