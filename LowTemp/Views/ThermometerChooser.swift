//
//  ThermometerChooser.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import SwiftUI

struct ThermometerChooser: View {
    @State var discoveredThermometers = [
        DiscoveredThermometer(
            name: "BlueTherm 28A8",
            rssi: -65
        ),
        DiscoveredThermometer(
            name: "BlueTherm B22A",
            rssi: -55
        )
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(discoveredThermometers, id: \.self) { thermometer in
                    DiscoveredThermometerRow(thermometer: thermometer)
                }
            }
            .navigationBarTitle(Text("Choose a Device to Add"), displayMode: .inline)
        }
    }
}

struct ThermometerChooser_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerChooser()
    }
}
