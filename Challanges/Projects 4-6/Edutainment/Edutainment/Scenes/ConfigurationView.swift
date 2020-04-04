//
//  ConfigurationView.swift
//  Edutainment
//
//  Created by Maris Lagzdins on 04/04/2020.
//  Copyright © 2020 DeveloperMaris. All rights reserved.
//

import SwiftUI

struct ConfigurationView: View {
    private let questionCount = ["5", "10", "20", "All"]

    @State private var maxMultiplicationNumber = 1
    @State private var selectedQuestionCount = 0

    var beginGameTapped: (_ maxMultiplicationNumber: Int, _ questionCount: String) -> Void

    var body: some View {
        VStack {
            Text("Game Settings")
                .font(.title)
                .bold()
            Stepper("Multiplication till \(maxMultiplicationNumber)", value: $maxMultiplicationNumber, in: 1...12)
            VStack(alignment: .leading) {
                Text("How many questions?")
                Picker("How many questions?", selection: $selectedQuestionCount) {
                    ForEach(0..<self.questionCount.count) { index in
                        Text(self.questionCount[index].description)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Spacer()
            Button(action: {
                let count = self.questionCount[self.selectedQuestionCount]
                self.beginGameTapped(self.maxMultiplicationNumber, count)
            }) {
                Text("Begin game")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView() { _, _ in
            // Do nothing
        }
    }
}
