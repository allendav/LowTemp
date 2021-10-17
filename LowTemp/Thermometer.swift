//
//  Thermometer.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

struct Thermometer: Hashable {
    var name: String
    var temperature: Float
}

extension Thermometer {
    func formattedTemperature() -> String {
        return String(format: "%.1f°", temperature)
    }
}
