//
//  ContentView.swift
//  WeSplit
//
//  Created by Maris Lagzdins on 29/02/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name: String = ""

    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationView {
            Form {
                // Form can contain only max 10 child element, to use more elements we need to use Group { ... }
                Section(header: Text("Title")) {
                    Text("Hello, World!")
                    Button("Tap count \(tapCount)") {
                        self.tapCount += 1
                    }
                }

                Section {
                    TextField("Enter your name", text: $name)
                    Text("My name is \(name)")
                }
            }
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(0..<students.count) { index in
//                    Text(self.students[index])
//                }
//            }
            .navigationBarTitle("Swift UI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
