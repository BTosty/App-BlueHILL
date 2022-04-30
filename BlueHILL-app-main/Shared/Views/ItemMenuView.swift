//
//  ItemMenu.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 28/10/2021.
//
import SwiftUI

struct ItemMenuView: View {
    @EnvironmentObject var colorTheme: ColorTheme
    var itemName: String
    var itemid: Int
    var itemrssi: Int
    var distance: String
    var body: some View {
        VStack(spacing: 50){
            Spacer()
            Button(action: {}){
                Text(String(itemid))
                    .font(
                        .system(size: 80))
                    .frame(width: 200.0, height: 200.0)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 5))
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .cornerRadius(100)
                    .shadow(radius: 10)
            }
            Text("Device is within: " + distance + "m").font(.title)
            Spacer()
        }.navigationBarTitle(Text(String(itemName)).font(.headline), displayMode: .inline)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: colorTheme.gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all))
    }
}

struct ItemMenu_Previews: PreviewProvider {
    static var previews: some View {
        ItemMenuView(itemName: "0", itemid: 0, itemrssi: 0, distance: "0")
    }
}
