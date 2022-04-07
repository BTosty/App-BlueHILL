//
//  TestBLE.swift
//  Place holder
//
//  Created by Harvijs Tucs on 07/11/2021.
//

import SwiftUI

struct TestBLE: View {
    @ObservedObject var bleManager = BLEManager()
      var body: some View {
          VStack (spacing: 10) {
   
              Text("Bluetooth Devices")
                  .font(.largeTitle)
                  .frame(maxWidth: .infinity, alignment: .center)
              List(bleManager.peripherals) { peripheral in
                  HStack {
                      Text(peripheral.name)
                      Spacer()
                      Text(String(Int((pow(10, (Double(-69)-Double(peripheral.rssi))/20)).rounded()))+"m")
                  }
              }.frame(height: 300)
   
              Spacer()
   
              Text("STATUS")
                  .font(.headline)
   
              // Status goes here
              if bleManager.isSwitchedOn {
                  Text("Bluetooth is switched on")
                      .foregroundColor(.green)
              }
              else {
                  Text("Bluetooth is NOT switched on")
                      .foregroundColor(.red)
              }
   
              Spacer()
   
              HStack {
                  VStack (spacing: 10) {
                      Button(action: {
                          self.bleManager.startScanning()
                      }) {
                          Text("Start Scanning")
                      }
                      Button(action: {
                          self.bleManager.stopScanning()
                      }) {
                          Text("Stop Scanning")
                      }
                  }.padding()
   
                  Spacer()
   
                  VStack (spacing: 10) {
                      Button(action: {
                          print("Start Advertising")
                      }) {
                          Text("Start Advertising")
                      }
                      Button(action: {
                          print("Stop Advertising")
                      }) {
                          Text("Stop Advertising")
                      }
                  }.padding()
              }
              Spacer()
          }
    }
}


struct TestBLE_Previews: PreviewProvider {
    static var previews: some View {
        TestBLE()
    }
}
