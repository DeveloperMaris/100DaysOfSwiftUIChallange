//
//  QuestionFactory.swift
//  Edutainment
//
//  Created by Maris Lagzdins on 04/04/2020.
//  Copyright © 2020 DeveloperMaris. All rights reserved.
//

import Foundation

struct MultiplicationQuestionFactory {
    var topNumber: Int

    func generate(_ count: UInt? = nil) -> [Question] {
        if let count = count {
            precondition(count > 0, "Count must be higher than 0")
            return generate(count)
        } else {
            return generateAll()
        }
    }

    private func generate(_ count: Int) -> [Question] {
        let range = 1...topNumber
        var questions = [Question]()

        while questions.count < count {
            let x = Int.random(in: range)
            let y = Int.random(in: range)

            let question = Question(question: "\(x) x \(y)", answer: String(x * y))
            questions.append(question)
        }

        return questions
    }

    private func generateAll() -> [Question] {
        let range = 1...topNumber
        var questions = [Question]()

        for x in range {
            for y in range {
                let question = Question(question: "\(x) x \(y)", answer: String(x * y))
                questions.append(question)
            }
        }
        return questions.shuffled()
    }
}
