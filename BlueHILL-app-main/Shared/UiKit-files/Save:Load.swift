//
//  Save:Load.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 17/05/2022.
//

import Foundation
import SwiftKeychainWrapper
import UIKit
import SwiftUI

class Save: ObservableObject{
    
    static let shared = Save()
    
    func SaveToKey(){
        let pick = ColorTheme.shared.selectedSceme
        var pickedback = "BP"
        
        let dist = Other.shared.setLimit
        
        switch pick {
        case .blueAndPurple:
            pickedback = "BP"
        case .blueAndYellow:
            pickedback = "BY"
        }
        
        print(pickedback)
        
        let pickedcol = UIColor(ColorTheme.shared.color)

        let colorToText = UIColor.StringFromUIColor(color: pickedcol)
        
        let dis: Bool = KeychainWrapper.standard.set(dist, forKey: "Limit")
        let back: Bool = KeychainWrapper.standard.set(pickedback, forKey: "Back")
        let color: Bool = KeychainWrapper.standard.set(colorToText, forKey: "Color")
        
        if color && back && dis{
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
        let back: String? = KeychainWrapper.standard.string(forKey: "Back") ?? "BP"
        let dist: String? = KeychainWrapper.standard.string(forKey: "Limit") ?? "10+"
        let pickedcol = UIColor.UIColorFromString(string: color ?? "[0.0, 0.4784314036369324, 0.9999999403953552, 1.0]")
        switch back{
        case "BP":
            ColorTheme.shared.selectedSceme = .blueAndPurple
        case "BY":
            ColorTheme.shared.selectedSceme = .blueAndYellow
        default:
            ColorTheme.shared.selectedSceme = .blueAndPurple
        }
        if let dis = dist{
            Other.shared.setLimit = dis
        }
        ColorTheme.shared.color = Color(pickedcol)
    }
}
