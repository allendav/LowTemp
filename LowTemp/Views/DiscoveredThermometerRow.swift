//
//  DiscoveredThermometerRow.swift
//  LowTemp
//
//  Created by Allen Snook on 10/22/21.
//

import SwiftUI

struct DiscoveredThermometerRow: View {
    var thermometer: DiscoveredThermometer

    var body: some View {
        VStack(alignment: .leading) {
            Text(thermometer.name)
            Text(thermometer.formattedRSSI())
                .font(.footnote)
        }
    }
}

struct DiscoveredThermometerRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveredThermometerRow(
            thermometer: PreviewDiscoveredThermometer()
        )
    }
}
