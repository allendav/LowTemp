# LowTemp

## Next Steps

- [x] Add the datetime of the temperature reading for a thermometer

- [x] Show a (canned) list of thermometers that can be added to the main view
- [x] Add a selected thermometer to the main view
- [x] Delete a thermometer from the main view

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
