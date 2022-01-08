//
//  ResultsViewController.swift
//  NewSwiftTest
//
//  Created by Кирилл Тараско on 07.01.2022.
//

import UIKit

class ResultsViewController: UIViewController {
// MARK: - IBOutlets
    
    @IBOutlet weak var answersTotal: UILabel!
    @IBOutlet weak var correctAnswersTotal: UILabel!
    @IBOutlet weak var wrongAnswersTotal: UILabel!
    
    @IBOutlet weak var totalScoreInPercents: UILabel!
    
// MARK: - Properties
    
    var totalRightAnswers: Int = 0
    var totalAnswers: Int = 0
// MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersTotal.layer.cornerRadius = 7
        answersTotal.layer.masksToBounds = true
        
        correctAnswersTotal.layer.cornerRadius = 7
        correctAnswersTotal.layer.masksToBounds = true
        
        wrongAnswersTotal.layer.cornerRadius = 7
        wrongAnswersTotal.layer.masksToBounds = true
        
        answersTotal.text = "Всего ответов: \(totalAnswers)"
        correctAnswersTotal.text = "Верных ответов: \(totalRightAnswers)"
        wrongAnswersTotal.text = "Неверных ответов: \(totalAnswers - totalRightAnswers)"
        
        let score = totalRightAnswers*100/totalAnswers
        totalScoreInPercents.text = "\(score)%"
    }
// MARK: - View Actions
    
    @IBAction func restartAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
