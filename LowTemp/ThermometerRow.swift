//
//  ThermometerRow.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ThermometerRow: View {
    let thermometer: Thermometer

    var body: some View {
        Text(thermometer.name)
    }
}

struct ThermometerRow_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerRow(thermometer: Thermometer(name: "Demo thermometer", temperature: 67.8))
    }
}
