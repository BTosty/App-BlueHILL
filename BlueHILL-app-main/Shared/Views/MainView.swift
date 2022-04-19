//
//  Main.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 21/10/2021.
//

import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var colorTheme: ColorTheme
    
    let ble = Sample()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
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
                        ForEach(ble.scanner) { item in
                            NavigationLink(destination:
                                ItemMenuView(
                                    itemName: item.name,
                                    itemid: item.id,
                                    itemrssi: item.rssi
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
                NavigationLink("•••", destination: SettingsView())
                    .font(.title)
                    .foregroundColor(Color.gray)
            }
        }.onAppear(){
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
                ble.sample()
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
