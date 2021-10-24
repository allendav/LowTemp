//
//  DeviceService.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import Combine
import CoreBluetooth
import Foundation

protocol DeviceServiceProvider {
    var discoveredThermometer: AnyPublisher<DiscoveredThermometer?, Never> { get }

    func startScan()
    func stopScan()
}

class PreviewDeviceService: DeviceServiceProvider {
    var discoveredThermometer: AnyPublisher<DiscoveredThermometer?, Never>  {
        discoveredThermometerSubject.eraseToAnyPublisher()
    }

    private let discoveredThermometerSubject = CurrentValueSubject<DiscoveredThermometer?, Never>(nil)

    func startScan() {}
    func stopScan() {}
}

class DeviceService: NSObject, DeviceServiceProvider {
    var discoveredThermometer: AnyPublisher<DiscoveredThermometer?, Never>  {
        discoveredThermometerSubject.eraseToAnyPublisher()
    }

    private let discoveredThermometerSubject = CurrentValueSubject<DiscoveredThermometer?, Never>(nil)

    private var centralManager: CBCentralManager!
    private var isScanning: Bool = false

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScan() {
        guard centralManager.state == .poweredOn else {
            return
        }

        guard !isScanning else {
            return
        }

        centralManager.scanForPeripherals(withServices: [Constants.environmentalServicesUUID], options: nil)
    }

    func stopScan() {
        guard isScanning else {
            return
        }

        centralManager.stopScan()
    }
}

extension DeviceService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        /// Continue only if the central is not powered on
        guard central.state != .poweredOn else {
            return
        }

        /// Continue only if we are in the scanning state
        guard isScanning else {
            return
        }

        /// Stop scanning
        stopScan()
    }

    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String : Any],
        rssi RSSI: NSNumber) {

        discoveredThermometerSubject.send(
            DiscoveredThermometer(
                name: peripheral.name ?? "Unknwown",
                rssi: RSSI,
                identifier: CBUUID(string: "FFFF")
            )
        )

        print(peripheral)
        print("rssi \(RSSI)")

    }
}

private extension DeviceService {
    enum Constants {
        static let environmentalServicesUUID = CBUUID(string: "181A")
    }
}
