//
//  DeviceService.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import CoreBluetooth
import Foundation

class DeviceService: NSObject {
    private var centralManager: CBCentralManager!

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    private func startScan() {
        centralManager.scanForPeripherals(withServices: [Constants.environmentalServicesUUID], options: nil)
    }
}

extension DeviceService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard central.state == .poweredOn else {
            return
        }

        startScan()
    }

    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String : Any],
        rssi RSSI: NSNumber) {

        print(peripheral)
        print("rssi \(RSSI)")
    }
}

private extension DeviceService {
    enum Constants {
        static let environmentalServicesUUID = CBUUID(string: "181A")
    }
}
