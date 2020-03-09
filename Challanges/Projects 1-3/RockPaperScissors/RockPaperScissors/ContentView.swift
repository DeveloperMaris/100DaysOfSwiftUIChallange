//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Maris Lagzdins on 09/03/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    var playerShouldWin: Bool

    var body: some View {
        HStack(spacing: 4) {
            Text("You must")
            if playerShouldWin {
                Text("win!")
                    .bold()
                    .foregroundColor(.green)
            } else {
                Text("lose!")
                    .bold()
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView: View {
    @State private var rounds = 1
    @State private var score = 0
    @State private var appMoveIndex = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var showFinalScore = false
    @State private var lastGuessWasCorrect: Bool?

    private let moves = ["Rock", "Paper", "Scissors"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Your score is \(score)")
                .font(.title)
                .foregroundColor(lastGuessWasCorrect != nil ? lastGuessWasCorrect == true ? Color.green : Color.red : Color.black)
            Text("App's choice: \(moves[appMoveIndex])")

            TaskView(playerShouldWin: shouldWin)

            HStack(spacing: 15) {
                ForEach(0..<moves.count) { moveIndex in
                    Button(action: {
                        self.playerTapped(moveIndex)
                    }) {
                        Text(self.moves[moveIndex])
                            .foregroundColor(.black)
                            .italic()
                            .bold()
                    }
                }
            }
        }
        .alert(isPresented: $showFinalScore) {
            Alert(
                title: Text("You finished the game"),
                message: Text("Your score is \(score)"),
                dismissButton: .default(Text("Play again")) {
                    self.restartGame()
                }
            )
        }
    }

    func playerTapped(_ playerMoveIndex: Int) {
        if playerScored(playerMoveIndex: playerMoveIndex, appMoveIndex: appMoveIndex, shouldWin: shouldWin) {
            score += 1
            lastGuessWasCorrect = true
        } else {
            if score > 0 {
                score -= 1
            }
            lastGuessWasCorrect = false
        }

        if rounds < 10 {
            nextRound()
        } else {
            showFinalScore = true
        }
    }

    func nextRound() {
        shouldWin = Bool.random()
        appMoveIndex = Int.random(in: 0..<moves.count)
        rounds += 1
    }

    func restartGame() {
        score = 0
        rounds = 0
        lastGuessWasCorrect = nil
        nextRound()
    }

    func playerScored(playerMoveIndex: Int, appMoveIndex: Int, shouldWin: Bool) -> Bool {
        if playerMoveIndex != appMoveIndex { // Check if player selects the same as the app
            if playerMoveIndex == 0 {
                if (appMoveIndex == moves.count - 1) == shouldWin {
                    return true
                }
            } else if playerMoveIndex == moves.count - 1 {
                if (appMoveIndex == 0) == !shouldWin {
                    return true
                }
            } else if (playerMoveIndex > appMoveIndex) == shouldWin {
                return true
            }
        }

        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
