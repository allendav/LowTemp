//
//  DiscoveredThermometer.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import Foundation

struct DiscoveredThermometer: Hashable {
    var name: String
    var rssi: NSNumber // in dB
}

extension DiscoveredThermometer {
    func formattedRSSI() -> String {
        return String(format: "RSSI: %d dB", rssi.intValue)
    }
}
