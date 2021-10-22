//
//  ThermometerStore.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import Foundation

class ThermometerStore: ObservableObject {
    @Published var thermometers = [Thermometer]()

    init() {
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

    func addThermometer(name: String) {
        thermometers.append(
            Thermometer(
                name: name,
                hasTemperatureReading: false,
                temperatureReading: 0,
                temperatureDate: Date(timeIntervalSinceNow: 0)
            )
        )
    }
}
