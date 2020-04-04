//
//  ContentView.swift
//  Edutainment
//
//  Created by Maris Lagzdins on 29/03/2020.
//  Copyright © 2020 DeveloperMaris. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    enum GameState {
        case active
        case settings
    }

    @State private var gameState = GameState.settings
    @State private var questions = [Question]()

    var body: some View {
        NavigationView {
            ZStack {
                if gameState == .settings {
                    ConfigurationView(beginGameTapped: configure)
                        .transition(.opacity)
                } else {
                    QuestionView(questions: questions) {
                        withAnimation {
                            self.gameState = .settings
                        }
                    }
                    .transition(.opacity)
                }
            }
            .padding()
            .navigationBarTitle("Edutainment")
        }
    }

    private func configure(_ maxMultiplicationNumber: Int, _ questionCount: String) {
        let factory = MultiplicationQuestionFactory(topNumber: maxMultiplicationNumber)
        self.questions = factory.generate(UInt(questionCount))

        withAnimation {
            self.gameState = .active
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
