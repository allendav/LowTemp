//
//  ThermometerStore.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import Combine
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

    private var cancellable: AnyCancellable?

    init(deviceService: DeviceServiceProvider) {
        self.deviceService = deviceService

        cancellable = deviceService.discoveredThermometer.sink(receiveValue: { thermometer in
            guard let thermometer = thermometer else {
                return
            }
            self.discoveredThermometers.append(thermometer)
        })
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
        print("starting discovery")
        deviceService.startScan()
    }

    private func stopDiscovery() {
        print("stopping discovery")
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
