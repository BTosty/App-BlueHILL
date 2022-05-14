//
//  AppDelelate.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 14/05/2022.
//

import UIKit
import BackgroundTasks

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // MARK: Registered refresh task :)
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "Need", using: nil){ task in
            self.checkdist(task: task as! BGAppRefreshTask)
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("cringe")
        sqeduleRef()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Cringe as well")
        sqeduleRef()
    }
    
    func sqeduleRef(){
        let request = BGAppRefreshTaskRequest(identifier: "Need")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 2)// check after 2 seconds
        
        do{
            try BGTaskScheduler.shared.submit(request)
        }catch{
            print("rejected: \(error)")
        }
    }
    
    func checkdist(task: BGAppRefreshTask){
        sqeduleRef()
        
        BLEManager().startScanning()
        if BLEManager().isSwitchedOn == false{
            print("Turn on bluetooth")
            BLEManager().stopScanning()
        }
        else{
            for device in BLEManager().peripherals{
                if device.distance == "5-10"{
                    print(device.name)
                    print("TOO FAR")
                }
            }
            BLEManager().stopScanning()
        }
    }
}
