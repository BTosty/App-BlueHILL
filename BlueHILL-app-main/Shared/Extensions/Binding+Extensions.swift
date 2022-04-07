//
//  Binding+Extensions.swift
//  Place holder (iOS)
//
//  Created by Daniel Klinge on 04/04/2022.
//

import SwiftUI

extension Binding {
    func onUpdate(_ action: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            action()
        })
    }
}
