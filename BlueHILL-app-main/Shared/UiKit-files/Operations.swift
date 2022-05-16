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
    static func update(using context: NSManagedObjectContext) -> [Operation]{
        let test = test(context: context)
        let test2 = test2(context: context)
        return [test2, test]
    }
}



class test: Operation{
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    override func main() {
        context.performAndWait {
            do{
                print("work tim")
                let blue = BLEManager()
                if blue.isSwitchedOn{
                    blue.startScanning()
                    for device in blue.peripherals{
                        if device.distance == "0-5"{
                            print(device.name)
                            print("TOO FAR")
                            
                        }
                    }
                    blue.stopScanning()
                }else{
                    print("Bluetooth is off")
                    blue.stopScanning()
                }
                
            }
        }
    }
}

class test2: Operation{
    private let context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    override func main() {
        context.performAndWait {
            do{
                print("ayuy")
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
}
