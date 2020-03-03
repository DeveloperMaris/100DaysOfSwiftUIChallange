//
//  ContentView.swift
//  TimeConversion
//
//  Created by Maris Lagzdins on 03/03/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

enum Units: String, CaseIterable {
    case seconds, minutes, hours, days
}

struct ContentView: View {
    let units = Units.allCases

    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1
    @State private var providedValue = ""

    private var result: Double {
        guard let value = Double(providedValue) else {
            return 0
        }

        let inputUnit = units[selectedInputUnit]
        let outputUnit = units[selectedOutputUnit]

        let seconds = value.seconds(from: inputUnit)
        return seconds.to(outputUnit)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From")) {
                    Picker("Select first unit", selection: $selectedInputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0].rawValue.capitalized)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("To")) {
                    Picker("Select second unit", selection: $selectedOutputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0].rawValue.capitalized)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    TextField("Value", text: $providedValue)
                        .keyboardType(.numberPad)
                    Text("\(result, specifier: "%.f")")
                }
            }
            .navigationBarTitle("Time Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

fileprivate extension Double {
    /// Converts time unit represented with Double to seconds
    /// - Parameter unit: Time unit
    /// - Returns: Seconds
    func seconds(from unit: Units) -> Self {
        switch unit {
        case .seconds:
            return self
        case .minutes:
            return Measurement(value: self, unit: UnitDuration.minutes).converted(to: .seconds).value
        case .hours:
            return Measurement(value: self, unit: UnitDuration.hours).converted(to: .seconds).value
        case .days:
            return Measurement(value: self * 24, unit: UnitDuration.hours).converted(to: .seconds).value
        }
    }

    /// Converts seconds represented with Double to other duration unit
    /// - Parameter unit: Duration unit
    /// - Returns: Destination unit value
    func to(_ unit: Units) -> Self {
        let mesasurement = Measurement(value: self, unit: UnitDuration.seconds)

        switch unit {
        case .seconds:
            return self
        case .minutes:
            return mesasurement.converted(to: .minutes).value
        case .hours:
            return mesasurement.converted(to: .hours).value
        case .days:
            return mesasurement.converted(to: .hours).value / 24
        }
    }
}
