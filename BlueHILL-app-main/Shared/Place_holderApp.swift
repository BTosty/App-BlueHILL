//
//  Place_holderApp.swift
//  Shared
//
//  Created by Harvijs Tucs on 17/10/2021.
//

import SwiftUI

@main
struct Place_holderApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ColorTheme())
        }.onChange(of: scenePhase){ newScenePhase in
            switch newScenePhase{
            case .background:
                BLEManager.shared.stopScanning()
            case .inactive:
                BLEManager.shared.stopScanning()
            case .active:
                BLEManager.shared.startScanning()
            @unknown default:
                BLEManager.shared.stopScanning()
            }
        }
    }
}
