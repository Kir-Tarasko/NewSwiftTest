//
//  DataManager.swift
//  NewSwiftTest
//
//  Created by Кирилл Тараско on 07.01.2022.
//

import Foundation


class DataManager {
    private let questions :[(question: String, rightAnswer: String, possibleAnswers: [String])] = [(question: "", rightAnswer: "", possibleAnswers: ["", "", "", ""])]
    
    private var test: Test!
    private var _totalAnswers = 0
    private var _totalRightAnswers = 0
    
    var question: String {
        return test.question
    }
    
    var possibleAnswers: [String] {
        return test.possibleAnswers
    }
    
    var totalAnswers: Int {
        return _totalAnswers
    }
    
    var totalRightAnswers: Int {
        return _totalRightAnswers
    }
    
    func refreshTest() {
        let randomIndex = Int.random(in: 0..<25)
        let testData = questions[randomIndex]
        
        test = Test(question: testData.question, possibleAnswers: testData.possibleAnswers, rightedAnswer: testData.rightAnswer)
    }
    
    func validateAnswer(index: Int) {
        _totalAnswers += 1
        if test.validatePossibleAnswer(index){
            _totalRightAnswers += 1
        }
    }

}
