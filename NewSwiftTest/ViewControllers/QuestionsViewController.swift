//
//  QuestionsViewController.swift
//  NewSwiftTest
//
//  Created by Кирилл Тараско on 07.01.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
  
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet var buttonAnswers: [UIButton]!
    
    
    let questionManager = DataManager()
    private var indexRange = -1
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.totalAnswers = questionManager.totalAnswers
        resultVC.totalRightAnswers = questionManager.totalRightAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = buttonAnswers.firstIndex(of: sender)!
        questionManager.validateAnswer(index: index)
        
        newQuestion()
    }
   
}

extension QuestionsViewController {
    func newQuestion() {
                
        if indexRange < questionManager.countOfQuestions {
            indexRange += 1
        } else if indexRange == (questionManager.countOfQuestions) {
            showResult()
        }
        
        questionManager.refreshTest(indexRange)
        question.text = questionManager.question
        
        for index in 0..<questionManager.possibleAnswers.count {
            let possibleAnswer = questionManager.possibleAnswers[index]
            let button = buttonAnswers[index]
            
            button.setTitle(possibleAnswer, for: .normal)
            
            let totalProgress = Float(indexRange) / Float(questionManager.countOfQuestions)
            progressBar.setProgress(totalProgress, animated: true)
        }
    }
    
    
    func showResult() {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
}
    


