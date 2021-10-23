//
//  LowTempApp.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

@main
struct LowTempApp: App {
    @ObservedObject var thermometerStore = ThermometerStore()
    let deviceService = DeviceService()

    var body: some Scene {
        WindowGroup {
            ContentView(thermometerStore: thermometerStore)
        }
    }
}
