//
//  Bluetooth-iBeacon.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 07/04/2022.
//

import Foundation

struct BLEPeripheral: Identifiable {
    let id: Int
    let name: String
    var rssi: Int
    let uuid: String
    let maj: String
    let min: String
}

class Sample: ObservableObject {
    
    @Published var detBeacon = [BLEPeripheral]()
    
    var scanner: RNLBeaconScanner?
    func sample() {
        
        print("Got")
        let testp = BLEPeripheral(id: 0, name: "test", rssi: 0, uuid: "test", maj: "test", min: "test")
        detBeacon.append(testp)
        print(testp.name)
        
        scanner = RNLBeaconScanner.shared()
        scanner?.startScanning()
        
        // Execute this code periodically (every second or so) to view the beacons detected
        
        if let detectedBeacons = scanner?.trackedBeacons() as? [RNLBeacon] {
            for beacon in detectedBeacons {
                let newPerippheral = BLEPeripheral(id: detBeacon.count, name: beacon.name, rssi: beacon.rssi.intValue, uuid: beacon.id1, maj: beacon.id2, min: beacon.id3)
                
                if newPerippheral.name == "BChip2"{
                    print(newPerippheral)
                    if detBeacon.count > 0{
                        for (deviceid, _) in detBeacon.enumerated(){
                            detBeacon[deviceid].rssi = newPerippheral.rssi
                        }
                    }
                    else{
                        detBeacon.append(newPerippheral)
                    }
                }
                /*if (beacon.beaconTypeCode.intValue == 0xbeac) {
                    // this is an AltBeacon
                    NSLog("Detected AltBeacon id1: %@ id2: %@ id3: %@", beacon.id1, beacon.id2, beacon.id3)
                }
                else if (beacon.beaconTypeCode.intValue == 0x00 && beacon.serviceUuid.intValue == 0xFEAA) {
                    // this is eddystone uid
                    NSLog("Detected EDDYSTONE-UID with namespace %@ instance %@", beacon.id1, beacon.id2)
                }
                else if (beacon.beaconTypeCode.intValue == 0x10 && beacon.serviceUuid.intValue == 0xFEAA) {
                    // this is eddystone url
                    NSLog("Detected EDDYSTONE-URL with %@", RNLURLBeaconCompressor.urlString(fromEddystoneURLIdentifier: beacon.id1))
                }
                else {
                    // some other beacon type
                    
                }*/
            }
        }
    }
}
