//
//  Main.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 21/10/2021.
//

import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var colorTheme: ColorTheme
    @EnvironmentObject var blue: BLEManager
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(white: 0, alpha: 0.9)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    let layout = [
        GridItem(spacing: 5),
        GridItem(spacing: 5)
    ]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20.0) {
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 5) {
                        ForEach(blue.peripherals) { item in
                            NavigationLink(destination:
                                ItemMenuView(
                                    itemName: item.name,
                                    itemid: item.id,
                                    itemrssi: item.rssi,
                                    distance: item.distance
                                )
                            ) {
                                VStack{
                                    Text(String(item.id))
                                        .font(.system(size: 50))
                                        .frame(width: 100.0, height: 100.0)
                                        .overlay(Circle().stroke(Color.black, lineWidth: 5))
                                        .frame(width: 100, height: 100)
                                        .background(Color.white).cornerRadius(100).shadow(radius: 10)
                                    Text(item.name).foregroundColor(Color.white).font(.title2)
                                }
                            }
                            .frame(width: 150.0, height: 150.0)
                            .background(colorTheme.color)
                            .cornerRadius(50)
                        }
                    }
                }
            }
            .navigationBarTitle(
                Text("Devices"),
                displayMode: .inline
            )
            .background(
                LinearGradient(
                    gradient: colorTheme.gradient,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).edgesIgnoringSafeArea(.all)
            )
            .toolbar{
                NavigationLink("?????????", destination: SettingsView())
                    .font(.title)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
