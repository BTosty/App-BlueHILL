//
//  Save:Load.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 17/05/2022.
//

import Foundation
import SwiftKeychainWrapper
import UIKit

class Save: ObservableObject{
    
    static let shared = Save()
    
    func SaveToKey(){
        
        let pickedcol = UIColor(ColorTheme.shared.color)
        
        print(pickedcol)
        
        let colorToText = UIColor.StringFromUIColor(color: pickedcol)
        
        print(colorToText)
        
        let color: Bool = KeychainWrapper.standard.set(colorToText, forKey: "Color")
        if color{
            print("Saved?")
        }
        else{
            print("Fail")
        }
    }
}

class Load: ObservableObject{
    
    static let shared = Load()
    
    func LoadFromKey(){
        
        
        
        let color: String? = KeychainWrapper.standard.string(forKey: "Color")
        
        let pickedcol = UIColor.UIColorFromString(string: color!)
        print(pickedcol)
    }
}
