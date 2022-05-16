//
//  Operations.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 16/05/2022.
//

import Foundation
import CoreData
import UserNotifications

struct Operations{
    static func update() -> [Operation]{
        let test = test()
        return [test]
    }
}



class test: Operation{
    
    override func main() {
        do{
            NSLog(">>>>>>>> work tim")
            let blue = BLEManager.shared
            if blue.isSwitchedOn{
                blue.startScanning()
                
                print(">>>>> BLUETOOTH IS WORKING YAY")
                

                if blue.peripherals.count < 1{
                    let content = UNMutableNotificationContent()
                    content.title = "BChip finder"
                    content.subtitle = "A BChip has been forgoten"
                    content.sound = UNNotificationSound.default
                    //le trigger
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    //le id
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    //send it
                    UNUserNotificationCenter.current().add(request)
                }
                
                for device in blue.peripherals{
                    print(">>>>> \(device.name)")
                    if device.distance == "0-5"{
                        NSLog(device.name)
                        NSLog(">>>>>>>> TOO FAR")
                        let content = UNMutableNotificationContent()
                        content.title = "BChip finder"
                        content.subtitle = "\(device.name) has been forgoten"
                        content.sound = UNNotificationSound.default
                        //le trigger
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                        //le id
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        //send it
                        UNUserNotificationCenter.current().add(request)
                    }
                }
                blue.stopScanning()
            }else{
                NSLog(">>>>>>>> Bluetooth is off")
                blue.stopScanning()
                let content = UNMutableNotificationContent()
                content.title = "BChip finder"
                content.subtitle = "Turn on bluetooth!"
                content.sound = UNNotificationSound.default
                //le trigger
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                //le id
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                //send it
                UNUserNotificationCenter.current().add(request)
            }
            
        }
    }
}

