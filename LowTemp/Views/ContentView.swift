//
//  ContentView.swift
//  LowTemp
//
//  Created by Allen Snook on 10/17/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var thermometerStore: ThermometerStore
    @State var showingThermometerChooser = false

    var body: some View {
        NavigationView {
            List {
                ForEach(thermometerStore.thermometers, id: \.self) { thermometer in
                    NavigationLink(destination: ThermometerDetail(thermometer: thermometer)) {
                        ThermometerRow(thermometer: thermometer)
                    }
                }
                .onDelete(perform: onDelete)
            }
            .navigationTitle(Localization.myThermometers)
            .navigationBarItems(
                trailing: Button(action: {
                    self.showingThermometerChooser = true
                    thermometerStore.performAction(action: .startDiscovery)
                }) {
                    Image(systemName: "plus.circle.fill")
                }
            )
        }.sheet(isPresented: $showingThermometerChooser) {
            ThermometerChooser(
                thermometerStore: self.thermometerStore,
                showingThermometerChooser: self.$showingThermometerChooser
            )
        }
    }

    func onDelete(at offsets: IndexSet) {
        // TODO: Flux action instead
        thermometerStore.thermometers.remove(atOffsets: offsets)
    }
}

private extension ContentView {
    enum Localization {
        static let myThermometers = NSLocalizedString(
            "Thermometers", comment: ""
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            thermometerStore: ThermometerStore(
                deviceService: PreviewDeviceService()
            )
        )
    }
}
