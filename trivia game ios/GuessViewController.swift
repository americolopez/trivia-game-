//
//  GuessViewController.swift
//  trivia game ios
//
//  Created by Americo Lopez on 3/19/18.
//  Copyright © 2018 Americo Lopez. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var addQuestionButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    var questions = [Question]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        generateQuestiontext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadQuestion(){
        let question1 = Question(questionText: "what color is the sun", answers: ["yellow" , "blue", "Green" , "purple"], correctAnswer: 0)
   questions.append(question1)
    }
    
    
    func generateAnswerButtons(question: Question){
        for i in 0...3 {
        let randomAnswer = Int(arc4random_uniform(UInt32(question.answers.count)))
            switch i {
            case 0:
                answer1Button.setTitle(question.answers[randomAnswer], for : . normal)
            case 1:
                answer2Button.setTitle(question.answers[randomAnswer], for : . normal)
            case 2:
                answer3Button.setTitle(question.answers[randomAnswer], for : . normal)
            case 3:
                answer4Button.setTitle(question.answers[randomAnswer], for : . normal)
            default:
                return
            }
            question.answers.remove(at: randomAnswer)
        }
        }
func generateQuestiontext() {
    let randomQuestionIndex = Int(arc4random_uniform(UInt32(questions.count)))
    let currentQuestion = questions[randomQuestionIndex]
    questionLabel.text = questions[randomQuestionIndex].questionText
    generateAnswerButtons(question: currentQuestion)
}
    

@IBAction func resetButtonTapped(_ sender: Any) {
    
    }
}

