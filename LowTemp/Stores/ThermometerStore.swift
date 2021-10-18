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
            Thermometer(name: "Backyard Patio", temperature: 5.3),
            Thermometer(name: "Garage", temperature: 62.4),
            Thermometer(name: "Master Bedroom", temperature: 68.0),
        ]
    }
}
