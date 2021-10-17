//
//  ThermometerDetail.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ThermometerDetail: View {
    var body: some View {
        VStack {
            Text("66.6")
                .font(.title)
            Text("Thermometer Title")
            Text("two minutes ago")
                .font(.footnote)
            Spacer()
        }
    }
}

struct ThermometerDetail_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerDetail()
    }
}
