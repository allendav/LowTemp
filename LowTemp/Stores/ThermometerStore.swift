//
//  ThermometerStore.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import Foundation

class ThermometerStore: ObservableObject {
    /// The Thermometers we are interested in
    ///
    @Published var thermometers = [Thermometer]()

    /// Thermometers we have discovered
    ///
    @Published var discoveredThermometers = [DiscoveredThermometer]()

    private var deviceService: DeviceServiceProvider

    init(deviceService: DeviceServiceProvider) {
        self.deviceService = deviceService

        /// Dummy data for now
        discoveredThermometers = [
            DiscoveredThermometer(
                name: "BlueTherm 28A8",
                rssi: -65
            ),
            DiscoveredThermometer(
                name: "BlueTherm B22A",
                rssi: -55
            )
        ]

        /// Dummy persisted data for now
        thermometers = [
            Thermometer(
                name: "Backyard Patio",
                hasTemperatureReading: true,
                temperatureReading: 5.3,
                temperatureDate: Date(timeIntervalSinceNow: -300)
            ),
            Thermometer(
                name: "Garage",
                hasTemperatureReading: true,
                temperatureReading: 62.4,
                temperatureDate: Date(timeIntervalSinceNow: -3000)
            ),
            Thermometer(
                name: "Master Bedroom",
                hasTemperatureReading: true,
                temperatureReading: 68.0,
                temperatureDate: Date(timeIntervalSinceNow: -30)
            )
        ]
    }
}
