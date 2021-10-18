//
//  ContentView.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var thermometerStore = ThermometerStore()

    var body: some View {
        NavigationView {
            List {
                ForEach(thermometerStore.thermometers, id: \.self) { thermometer in
                    NavigationLink(destination: ThermometerDetail(thermometer: thermometer)) {
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
