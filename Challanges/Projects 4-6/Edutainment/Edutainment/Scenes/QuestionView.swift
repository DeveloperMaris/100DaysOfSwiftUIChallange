//
//  QuestionView.swift
//  Edutainment
//
//  Created by Maris Lagzdins on 04/04/2020.
//  Copyright © 2020 DeveloperMaris. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    let questions: [Question]

    @State private var currentQuestion = 0
    @State private var answer = ""
    @State private var score = 0
    @State private var showScore = false

    var playAgainTapped: () -> Void
    
    var body: some View {
        let question = questions[currentQuestion]

        return ZStack {
            VStack {
                Text("What is \(question.question)?")
                    .font(.title)
                    .bold()
                TextField("Enter result", text: $answer)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .padding(.bottom)
                Button(action: {
                    self.submit(self.answer, for: question)
                }) {
                    Text("Submit answer")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(self.answer.isEmpty ? Color.gray : Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .disabled(self.answer.isEmpty ? true : false)
                .opacity(Double(self.answer.isEmpty ? 0.5 : 1))
            }
            .alert(isPresented: $showScore) {
                Alert(
                    title: Text("Game over"),
                    message: Text("You answered \(score) of \(questions.count) correctly!"),
                    dismissButton: .default(Text("Play again"), action: playAgainTapped)
                )
            }
            VStack {
                Text("Question \(currentQuestion + 1) / \(questions.count)")
                    .font(.caption)
                Spacer()
            }
        }
    }

    private func submit(_ answer: String, for question: Question) {
        if question.answer == answer {
            score += 1
        }

        askQuestion()
    }

    private func askQuestion() {
        if currentQuestion + 1 < questions.count {
            currentQuestion += 1
            answer = ""
        } else {
            showScore = true
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(questions: [
            Question(question: "5 x 5", answer: "25")
        ]) {
            // Do nothing
        }
    }
}
