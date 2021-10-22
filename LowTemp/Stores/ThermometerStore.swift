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
                temperatureReading: 5.3,
                temperatureDate: Date(timeIntervalSinceNow: -300)
            ),
            Thermometer(
                name: "Garage",
                temperatureReading: 62.4,
                temperatureDate: Date(timeIntervalSinceNow: -3000)
            ),
            Thermometer(
                name: "Master Bedroom",
                temperatureReading: 68.0,
                temperatureDate: Date(timeIntervalSinceNow: -30)
            )
        ]
    }
}
