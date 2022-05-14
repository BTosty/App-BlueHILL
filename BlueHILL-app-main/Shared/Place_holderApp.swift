//
//  Place_holderApp.swift
//  Shared
//
//  Created by Harvijs Tucs on 17/10/2021.
//

import SwiftUI

@main
struct Place_holderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ColorTheme())
                .environmentObject(BLEManager())
        }
    }
}
