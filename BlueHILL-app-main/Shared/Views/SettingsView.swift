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
    @State private var selectedIndex: Int = -1
    
    var body: some View {

        VStack {
            ScrollView {
                ColorPicker(selection: $colorTheme.color) {
                    Text("Color scheme").font(.title2).foregroundColor(Color.white)
                }
                .frame(
                    maxWidth: .infinity,
                    minHeight: 50
                )
                .background(Color.black)
                .opacity(0.8)
                
                Spacer()
                
                DisclosureGroup("Background theme") {
/*                    RadioGroupPicker(selectedIndex: $selectedIndex, titles: ["First", "Second", "Third", "Done"])
                        .selectedColor(.systemRed)
                        .titleAlignment(.right)
                        .environment(\.layoutDirection, .rightToLeft)
                        .fixedSize()*/
                    Toggle(isOn: $blueAndPurpleSelected.onUpdate {
                        if (colorTheme.selectedSceme == .blueAndPurple){
                            blueAndPurpleSelected = true
                        }
                        else{
                            colorTheme.selectedSceme = .blueAndPurple
                            blueAndYellowSelected.toggle()
                        }
                    }) {
                        Text("Blue and Purple")
                            .font(.title2)
                    }
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 50
                    )
                    
                    Toggle(isOn: $blueAndYellowSelected.onUpdate {
                        if (colorTheme.selectedSceme == .blueAndYellow){
                            blueAndYellowSelected = true
                        }
                        else{
                            colorTheme.selectedSceme = .blueAndYellow
                            blueAndPurpleSelected.toggle()
                        }
                    }) {
                        Text("Blue and Yellow")
                            .font(.title2)
                    }
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 50
                    )
                }
                .frame(
                    maxWidth: .infinity,
                    minHeight: 50
                )
                .font(.title2)
                .background(Color.black)
                .opacity(0.8)
                .foregroundColor(Color.white)
                .font(.title2)
                
                Spacer()
            }
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
