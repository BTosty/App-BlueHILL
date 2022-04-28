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
    var distance: Double
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    let setStrenght = 2
    let setPower = -50
    
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
        }
        else {
            isSwitchedOn = false
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
        
        let distance = Double(1000*pow(10.0, Double(1000*(setPower-RSSI.intValue)/(10*setStrenght)).rounded()/1000)).rounded()/1000
        
        
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue, distance: distance)
        
        if newPeripheral.name == "BChip2"{
            print(newPeripheral)
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
}
