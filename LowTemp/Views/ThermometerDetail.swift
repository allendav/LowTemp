//
//  ThermometerDetail.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ThermometerDetail: View {
    var thermometer: Thermometer

    var body: some View {
        VStack {
            Text(thermometer.formattedTemperature())
                .font(.title)
            Text(thermometer.name)
            Text("two minutes ago")
                .font(.footnote)
            Spacer()
        }
    }
}

struct ThermometerDetail_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerDetail(thermometer: Thermometer(name: "Demo Thermometer", temperature: 67.8))
    }
}
