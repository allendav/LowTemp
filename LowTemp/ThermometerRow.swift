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
        HStack {
            Text(thermometer.formattedTemperature())
                .font(.title)
                .frame(width: 70, alignment: .leading)
            VStack(alignment: .leading) {
                Text(thermometer.name)
                Text("2 minutes ago")
                    .font(.footnote)
            }
        }
    }
}

struct ThermometerRow_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerRow(thermometer: Thermometer(name: "Demo Thermometer", temperature: 67.8))
    }
}
