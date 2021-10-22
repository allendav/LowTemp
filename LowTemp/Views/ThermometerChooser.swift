//
//  ThermometerChooser.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import SwiftUI

struct ThermometerChooser: View {
    @Binding var showThermometerChooser: Bool

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
            .navigationBarTitle(Text(Localization.addDevice), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showThermometerChooser = false
            }) {
                Text(Localization.done).bold()
            })
        }
    }
}

private extension ThermometerChooser {
    enum Localization {
        static let addDevice = NSLocalizedString(
            "Add Device",
            comment: ""
        )
        static let done = NSLocalizedString(
            "Done",
            comment:""
        )
    }
}

struct ThermometerChooser_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerChooser(showThermometerChooser: .constant(true))
    }
}
