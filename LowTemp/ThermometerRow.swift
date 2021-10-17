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
            Text(String(thermometer.temperature))
                .font(.title)
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
        ThermometerRow(thermometer: Thermometer(name: "Demo thermometer", temperature: 67.8))
    }
}
