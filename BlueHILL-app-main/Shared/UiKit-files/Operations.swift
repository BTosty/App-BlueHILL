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
        let test2 = test2()
        return [test2, test]
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

                for device in blue.peripherals{
                    print(">>>>> \(device.name)")
                    if device.distance == "0-5"{
                        NSLog(device.name)
                        NSLog(">>>>>>>> TOO FAR")
                        
                    }
                }
                blue.stopScanning()
            }else{
                NSLog(">>>>>>>> Bluetooth is off")
                blue.stopScanning()
            }
            
        }
    }
}

class test2: Operation{

    override func main() {
        do{
            NSLog(">>>>>>>> ayuy")
            let content = UNMutableNotificationContent()
            content.title = "Warning"
            content.subtitle = "x has been forgoten"
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
