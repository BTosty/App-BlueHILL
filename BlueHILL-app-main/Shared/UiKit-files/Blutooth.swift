//
//  Blutooth.swift
//  Place holder
//
//  Created by Harvijs Tucs on 07/11/2021.
//
import Foundation
import CoreBluetooth
import UIKit

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    var rssi: Int
    var distance: String
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    var myCentral: CBCentralManager!
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    
    override init() {
        super.init()
         
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
                self.startScanning()
            }
        }
        else {
            isSwitchedOn = false
            stopScanning()
        }
    }


    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
            
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
        }
        else {
            peripheralName = "Unknown"
        }
        
        var distav = ""
        
        let posrssi = abs(RSSI.int32Value)
        
        if posrssi < 80{
            distav = "0-5"
        }
        else if posrssi < 95{
            distav = "5-10"
        }
        else{
            distav = "10+"
        }
        
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue, distance: distav)
        
        if newPeripheral.name == "BChip"{
            print(newPeripheral.rssi)
            if peripherals.count > 0{
                for (deviceid, _) in peripherals.enumerated(){
                    peripherals[deviceid].rssi = newPeripheral.rssi
                    peripherals[deviceid].distance = newPeripheral.distance
                }
            }
            else{
                peripherals.append(newPeripheral)
            }

        }
    }
         
    func startScanning() {
        print("startScanning")
        myCentral.scanForPeripherals(withServices: nil, options: nil)
    }
         
    func stopScanning() {
        print("stopScanning")
        myCentral.stopScan()
    }
    
    func backcheck(){
        startScanning()
        if isSwitchedOn == false{
            print("Turn on bluetooth")
            stopScanning()
        }
        else{
            for device in peripherals{
                if device.distance == "0-5"{
                    
                    print(device.name)
                    print("TOO FAR")
                    
                }
            }
            stopScanning()
        }
    }
}
