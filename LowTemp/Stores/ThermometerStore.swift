//
//  ThermometerStore.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import CoreBluetooth
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
                rssi: -65,
                identifier: CBUUID()
            ),
            DiscoveredThermometer(
                name: "BlueTherm B22A",
                rssi: -55,
                identifier: CBUUID()
            )
        ]
    }

    func performAction(action: ThermometerStoreAction) {
        switch action {
            case .loadThermometers:
                loadThermometers()
            case .forgetThermometer(let thermometer):
                forgetThermometer(thermometer: thermometer)
            case .startDiscovery:
                startDiscovery()
            case .stopDiscovery:
                stopDiscovery()
            case .rememberThermometer(let thermometer):
                rememberThermometer(thermometer: thermometer)
        }
    }

    private func loadThermometers() {
        /// Dummy data for now
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

    private func forgetThermometer(thermometer: Thermometer) {
        // TODO
    }

    private func startDiscovery() {
        deviceService.startScan()
    }

    private func stopDiscovery() {
        deviceService.stopScan()
    }

    private func rememberThermometer(thermometer: DiscoveredThermometer) {

    }
}

enum ThermometerStoreAction {
    /// Prompts the store to load thermometers from persistent storage
    ///
    case loadThermometers

    /// Prompts the store to forget the given thermometer
    ///
    case forgetThermometer(thermometer: Thermometer)

    /// Starts discovery of new thermometers.
    ///
    case startDiscovery

    /// Stops discovery of new thermometers
    ///
    case stopDiscovery

    /// Prompts the store to remember a discovered thermometer
    ///
    case rememberThermometer(thermometer: DiscoveredThermometer)
}
