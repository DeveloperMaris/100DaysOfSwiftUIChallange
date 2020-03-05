//
//  ContentView.swift
//  WeSplit
//
//  Created by Maris Lagzdins on 29/02/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]

    var total: Double {
        // Calculate the total amount here
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }

    var totalPerPerson: Double {
        // Calculate the total per person here
        guard let peopleCount = Double(numberOfPeople) else {
            return 0
        }

        let amountPerPerson = total / peopleCount

        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }

                Section(header: Text("Total amount")) {
                    Text("$\(total, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] > 0 ? .black : .red)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
