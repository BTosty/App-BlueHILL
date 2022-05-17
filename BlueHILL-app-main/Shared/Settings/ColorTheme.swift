//
//  ColorTheme.swift
//  Place holder (iOS)
//
//  Created by Daniel Klinge on 04/04/2022.
//

import SwiftUI

enum ColorScheme {
    case blueAndPurple
    case blueAndYellow
}

class ColorTheme: ObservableObject {

    static let shared = ColorTheme()
    
    @Published var selectedSceme: ColorScheme = .blueAndPurple
    @Published var color = Color.blue
    @Published var selectedIndex: Int = 0

    var gradient: Gradient {
        get {
            switch selectedSceme {
            case .blueAndPurple:
                return Gradient(colors: [Color.blue, Color.purple])
            case .blueAndYellow:
                return Gradient(colors: [Color.blue, Color.yellow])
            }
        }
    }
}
