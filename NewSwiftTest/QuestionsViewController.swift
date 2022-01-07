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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    func newQuestion() {
        questionManager.refreshTest()
        question.text = questionManager.question
        
        for i in 0..<questionManager.possibleAnswers.count {
            let possibleAnswer = questionManager.possibleAnswers[i]
            let button = buttonAnswers[i]
            
            button.setTitle(possibleAnswer, for: .normal)
        }
    }
   
    func showResult() {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.tot
    }
   
}



    


