//
//  ThermometerChooser.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import SwiftUI

struct ThermometerChooser: View {
    @ObservedObject var thermometerStore: ThermometerStore
    @Binding var showingThermometerChooser: Bool

    var body: some View {
        NavigationView {
            List {
                ForEach(thermometerStore.discoveredThermometers, id: \.self) { thermometer in
                    DiscoveredThermometerRow(thermometer: thermometer)
                        .onTapGesture {
                            // TODO: Flux action instead
                            thermometerStore.thermometers.append(
                                Thermometer(
                                    name: thermometer.name,
                                    hasTemperatureReading: false,
                                    temperatureReading: 0,
                                    temperatureDate: Date(timeIntervalSinceNow: 0)
                                )
                            )
                            thermometerStore.performAction(action: .stopDiscovery)
                            showingThermometerChooser = false
                        }
                }
            }
            .navigationBarTitle(Text(Localization.addDevice), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                thermometerStore.performAction(action: .stopDiscovery)
                showingThermometerChooser = false
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
        ThermometerChooser(
            thermometerStore: ThermometerStore(
                deviceService: PreviewDeviceService()
            ),
            showingThermometerChooser: .constant(true)
        )
    }
}
