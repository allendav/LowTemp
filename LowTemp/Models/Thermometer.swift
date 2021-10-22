//
//  Thermometer.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import Foundation

struct Thermometer: Hashable {
    var name: String
    var hasTemperatureReading: Bool
    var temperatureReading: Float // Deg F
    var temperatureDate: Date
}

extension Thermometer {
    func formattedTemperatureReading() -> String {
        guard hasTemperatureReading else {
            return("--.-°")
        }

        return String(format: "%.1f°", temperatureReading)
    }

    func formattedTemperatureDate() -> String {
        guard hasTemperatureReading else {
            return("--")
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: temperatureDate)
    }
}
