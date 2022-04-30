//
//  MainSettings.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 21/10/2021.
//

#if canImport(SwiftUI)
import RadioGroup
import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var colorTheme: ColorTheme

    // EnvironmentObject is injected AFTER view constructor call
    // so you can't use it to init @State variables.
    // Because of that we init "default" value and then override
    // them in onAppear function call
    @State private var blueAndPurpleSelected: Bool = false
    @State private var blueAndYellowSelected: Bool = false
    
    init (){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack {
            List{
                Section(header: Text("Box settings")){
                    ColorPicker(selection: $colorTheme.color, supportsOpacity: false) {
                        Text("Box color")
                    }
                    .foregroundColor(Color.white)
                    .listRowBackground(Color.black)
                }
                Section(header: Text("Background settings")){
                    DisclosureGroup("Background color theme") {
                        RadioGroupPicker(selectedIndex: $colorTheme.selectedIndex, titles: ["Blue and Purple", "Blue and Yellow"])
                            .selectedColor(.green)
                            .itemSpacing(100)
                            .titleColor(.white)
                            .titleAlignment(.left)
                            .environment(\.layoutDirection, .rightToLeft)
                            .fixedSize()
                            .onChange(of: colorTheme.selectedIndex){newValue in
                                print(newValue)
                                switch newValue{
                                case 0:
                                    colorTheme.selectedSceme = .blueAndPurple
                                case 1:
                                    colorTheme.selectedSceme = .blueAndYellow
                                default:
                                    colorTheme.selectedSceme = .blueAndPurple
                                }
                            }
                    }
                    .foregroundColor(Color.white)
                    .listRowBackground(Color.black)
                }
            }
            .foregroundColor(Color.white)
            Spacer()
        }
        .onAppear(perform: {
            blueAndPurpleSelected = colorTheme.selectedSceme == .blueAndPurple
            blueAndYellowSelected = colorTheme.selectedSceme == .blueAndYellow
        })
        .navigationBarTitle(
            Text("Settings"),
            displayMode: .inline
        )
        .background(
            LinearGradient(
                gradient: colorTheme.gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all))
    }
}

struct MainSettings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
