//
//  ContentView.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var followedThermometers = [
        Thermometer(name: "Backyard", temperature: 5.3),
        Thermometer(name: "Garage", temperature: 62.4),
        Thermometer(name: "Office", temperature: 68.0),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(followedThermometers, id: \.self) { thermometer in
                    NavigationLink(destination: ThermometerDetail()) {
                        ThermometerRow(thermometer: thermometer)
                    }
                }
            }
            .navigationTitle(Localization.myThermometers)
        }
    }
}

private extension ContentView {
    enum Localization {
        static let myThermometers = NSLocalizedString(
            "My Thermometers", comment: ""
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
