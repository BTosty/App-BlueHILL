//
//  OtherSettings.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 18/05/2022.
//

import Foundation
import SwiftUI

class Other: ObservableObject{
    static let shared = Other()
    
    @Published var setLimit = "10+"
    @Published var selectedIndex = 2
}
