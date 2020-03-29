//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Maris Lagzdins on 04/03/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)

    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var selectedFlag: Int? = nil

    @State private var animateCorrectAnswer = false
    @State private var animateWrongAnswer = false
    @State private var incorrectFlagOpacity = 1.0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0..<3) { number in
                    Button(action: {
                        withAnimation(.spring()) {
                            self.flagTapped(number)
                        }
                    }) {
                        FlagImage(imageName: self.countries[number])
                    }
                    .rotationEffect(.degrees(number == self.selectedFlag && self.animateWrongAnswer ? 90 : 0), anchor: .bottomLeading)
                    .rotation3DEffect(.degrees(number == self.selectedFlag && self.animateCorrectAnswer ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                    .opacity(number == self.selectedFlag ? 1 : self.incorrectFlagOpacity)
                }

                Text("Your score is \(score)")
                    .foregroundColor(.white)

                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func flagTapped(_ number: Int) {
        selectedFlag = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            animateCorrectAnswer = true
        } else {
            scoreTitle = "Wrong, that's the flag of \(self.countries[number])"
            score -= 1
            animateWrongAnswer = true
        }

        incorrectFlagOpacity = 0.25
        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        incorrectFlagOpacity = 1.0
        animateCorrectAnswer = false
        animateWrongAnswer = false
        selectedFlag = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
