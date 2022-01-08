//
//  ResultsViewController.swift
//  NewSwiftTest
//
//  Created by Кирилл Тараско on 07.01.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var answersTotal: UILabel!
    @IBOutlet weak var correctAnswersTotal: UILabel!
    @IBOutlet weak var wrongAnswersTotal: UILabel!
    
    @IBOutlet weak var totalScoreInPercents: UILabel!
    var totalRightAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersTotal.text = "Всего ответов: \(totalAnswers)"
        correctAnswersTotal.text = "Верных ответов: \(totalRightAnswers)"
        wrongAnswersTotal.text = "Не верных ответов: \(totalAnswers - totalRightAnswers)"
        
        let score = totalRightAnswers*100/totalAnswers
        totalScoreInPercents.text = "\(score)%"
    }
    
    @IBAction func restartAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
