//
//  ContentView.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var followedThermometers = [
        Thermometer(name: "Backyard", temperature: 55.3),
        Thermometer(name: "Garage", temperature: 62.4),
        Thermometer(name: "Office", temperature: 68.0),
    ]

    var body: some View {
        List {
            ForEach(followedThermometers, id: \.self) { thermometer in
                Text(thermometer.name)
            }
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}