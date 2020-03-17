//
//  ContentView.swift
//  BetterRest
//
//  Created by Maris Lagzdins on 17/03/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()

    var body: some View {
        // MARK: - Entering numbers with Stepper

//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//            Text("\(sleepAmount, specifier: "%g") hours")
//        }

        // MARK: - Selecting dates and times with DatePicker

//        DatePicker("Please enter a date", selection: $wakeUp)

//        Form {
//            DatePicker("Please enter a date", selection: $wakeUp)
//        }

//        let now = Date()
//        let tomorrow = Date().addingTimeInterval(86400)
//        let range = now...tomorrow
//        DatePicker("Please enter a date", selection: $wakeUp, in: Date()..., displayedComponents: .hourAndMinute)
//            .labelsHidden()

        // MARK: - Working with dates

//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//
//        let date = Calendar.current.date(from: components) ?? Date()

//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minue = components.minute ?? 0

        let formatter = DateFormatter()
        formatter.timeStyle = .short

        let dateString = formatter.string(from: Date())

        return DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()

        // MARK: - Training a model with Create ML

        ...
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
