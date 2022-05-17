//
//  AppDelelate.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 14/05/2022.
//

import UIKit
import BackgroundTasks
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
      _ application: UIApplication,
      configurationForConnecting connectingSceneSession: UISceneSession,
      options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
      let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
      sceneConfig.delegateClass = SceneDelegate.self
      return sceneConfig
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        let save = Save.shared
        
        save.SaveToKey()
    }
}
