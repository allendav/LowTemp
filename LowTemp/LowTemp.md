# LowTemp

## Design

### View Layer
- SwiftUI based
- Use @State and @Bindings for temporal view state, rely on Stores for "persisted" state

### Store Layer
- Acts as an intermediary between the Service Layer and the View Layer
- Instantiated during Application startup
- Stores are passed needed Services as dependencies
- Implement ObservableObject for SwiftUI Views to observe
- Expose @Published properties (e.g. an array of Thermometers)
- Passed into Views as dependencies

### Services Layer
- Shared resources, e.g. Bluetooth devices
- Instantiated during Application startup
- Passed into Stores as dependencies

## Next Steps

- [ ] Define a "no thermometers, add one" view
- [ ] Have ThermometerChooser use Thermometer store discovered thermometers as its data source

- [ ] Add a dispatcher and have Thermometer store register with it for a .didDiscover(Thermometer) action
- [ ] Have DeviceService fire actions at Thermometer store as it discovers thermometers

- [ ] Persist thermometers to settings or core data or something

- [ ] Let the user name (rename) a thermometer

- [ ] Populate the list of thermometers that can be added to the view from coreBluetooth
- [ ] Connect (and then disconnect) to the thermometer and show the current temperature on the thermometers detail view

- [ ] Periodically update the temperature of thermometers on the list view from coreBluetooth

- [ ] Add the datetime of the last connection attempt for a thermometer

- [ ] Properly handle a thermometer that has never returned a reading, if that's even possible
