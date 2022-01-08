//
//  Quiz.swift
//  NewSwiftTest
//
//  Created by Кирилл Тараско on 07.01.2022.
//

import Foundation


class Test {
    let question: String
    let possibleAnswers: [String]
    private let rightedAnswer: String
    
    init (question: String, possibleAnswers: [String], rightedAnswer: String) {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.rightedAnswer = rightedAnswer
    }
    
    func validatePossibleAnswer(_ index: Int) -> Bool {
        let answer = possibleAnswers[index]
        
        return answer == rightedAnswer
    }
}
