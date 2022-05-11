//
//  Place_holderApp.swift
//  Shared
//
//  Created by Harvijs Tucs on 17/10/2021.
//

import SwiftUI
import BackgroundTasks

@main
struct Place_holderApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ColorTheme())
                .environmentObject(Sample())
                .environmentObject(BLEManager())
        }
    }
}

/*class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
 
  func applicationDidEnterBackground(_ application: UIApplication) {
    submitBackgroundTasks()
  }
  
  func submitBackgroundTasks() {
    // Declared at the "Permitted background task scheduler identifiers" in info.plist
    let backgroundAppRefreshTaskSchedulerIdentifier = "need"
    let timeDelay = 2.0

    do {
      let backgroundAppRefreshTaskRequest = BGAppRefreshTaskRequest(identifier: backgroundAppRefreshTaskSchedulerIdentifier)
      backgroundAppRefreshTaskRequest.earliestBeginDate = Date(timeIntervalSinceNow: timeDelay)
      try BGTaskScheduler.shared.submit(backgroundAppRefreshTaskRequest)
      print("Submitted task request")
    } catch {
      print("Failed to submit BGTask")
    }
  }
}*/
