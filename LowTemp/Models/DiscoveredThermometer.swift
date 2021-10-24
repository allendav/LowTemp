//
//  DiscoveredThermometer.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import CoreBluetooth

import Foundation

struct DiscoveredThermometer: Hashable {
    var name: String
    var rssi: NSNumber // in dB
    var identifier: CBUUID
}

extension DiscoveredThermometer {
    func formattedRSSI() -> String {
        return String(format: "RSSI: %d dB", rssi.intValue)
    }
}

func PreviewDiscoveredThermometer() -> DiscoveredThermometer {
    return DiscoveredThermometer(
        name: "BlueTherm 3C19",
        rssi: -88,
        identifier: CBUUID(string: "97E8B900-2BB9-173B-5EF3-B2569A403C19")
    )
}
