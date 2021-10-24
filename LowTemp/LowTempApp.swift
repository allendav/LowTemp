//
//  LowTempApp.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

@main
struct LowTempApp: App {
    private let deviceService: DeviceService
    private let thermometerStore: ThermometerStore

    init() {
        /// Initialize services layer
        deviceService = DeviceService()

        /// Initialize stores
        thermometerStore = ThermometerStore(deviceService: deviceService)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(thermometerStore: thermometerStore)
        }
    }
}
