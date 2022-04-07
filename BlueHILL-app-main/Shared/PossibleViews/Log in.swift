//
//  Log in.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 21/10/2021.
//

import SwiftUI

struct Log_in: View {
    func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: MainView())
            window.makeKeyAndVisible()
        }
    }
    var body: some View {
        VStack(){
            Spacer()
             Text("Log in with")
                  .font(.title)
            Spacer()
             VStack(spacing: 50){
                 Button(action: {
                     goHome()
                 }) {
                        Text("Apple ID")
                            .font(.title2)
                  }
                  .frame(width: 320.0, height: 50.0)
                  .background(Color.black)
                  .cornerRadius(50)
                  .overlay(
                       RoundedRectangle(cornerRadius: 25)
                           .stroke(Color.white, lineWidth: 2))
                  Button(action: {}) {
                       Text("FaceBook")
                            .font(.title2)
                  }
                  .frame(width: 320.0, height: 50.0)
                  .background(Color.blue)
                  .cornerRadius(50)
                  .overlay(
                       RoundedRectangle(cornerRadius: 25)
                           .stroke(Color.white, lineWidth: 2))
                  Button(action: {}) {
                       Text("Google")
                            .font(.title2)
                  }
                  .frame(width: 320.0, height: 50.0)
                  .background(Color.red)
                  .cornerRadius(50)
                  .overlay(
                       RoundedRectangle(cornerRadius: 25)
                           .stroke(Color.white, lineWidth: 2))
             }
             .padding()
             .foregroundColor(Color.white)
            Spacer()
        }
    }
}

struct Log_in_Previews: PreviewProvider {
    static var previews: some View {
        Log_in()
            .preferredColorScheme(.light)
            
    }
}
