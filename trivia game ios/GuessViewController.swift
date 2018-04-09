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
    var askedQuestions =
        [Question]()
    var score = 0
    var displayedQuestion: Question?
    var colors = [#colorLiteral(red: 1, green: 0.337254902, blue: 0.5019607843, alpha: 1),#colorLiteral(red: 0.4901960784, green: 1, blue: 0.337254902, alpha: 1),#colorLiteral(red: 0.337254902, green: 0.6470588235, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.5803921569, blue: 0.337254902, alpha: 1)]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        generateQuestiontext()
        scoreLabel.text = "score:\(score)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadQuestion(){
        let question1 = Question(questionText: "what color is the sun", answers: ["yellow" , "blue", "Green" , "purple"], correctAnswer: 0)
         let question2 = Question(questionText: "who was the first person on the moon", answers: ["Neil Armstrong" , "blue", "Green" , "purple"], correctAnswer: 0)
        questions.append(question1)
        questions.append(question2)
    }
    
    
    func generateAnswerButtons(question: Question, colorSelection: [UIColor]){
        var colorArray = colorSelection
        var questionAnswers = question.answers
        for i in 0...3 {
            let randomAnswer = Int(arc4random_uniform(UInt32(questionAnswers.count)))
            let randomColor = Int(arc4random_uniform(UInt32(colorArray.count)))
            switch i {
            case 0 :
                answer1Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                answer1Button.backgroundColor = colorArray[randomColor]
            case 1:
                answer2Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                answer2Button.backgroundColor = colorArray[randomColor]
            case 2:
                answer3Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                answer3Button.backgroundColor = colorArray[randomColor]
            case 3:
                answer4Button.setTitle(questionAnswers[randomAnswer], for: .normal)
                answer4Button.backgroundColor = colorArray[randomColor]
            default:
                return
            }
            questionAnswers.remove(at: randomAnswer)
            colorArray.remove(at: randomColor)
    }
    }
    func generateQuestiontext() {
        scoreLabel.text = "score: \(score)"
        let randomQuestionIndex = Int(arc4random_uniform(UInt32(questions.count)))
        let currentQuestion = questions[randomQuestionIndex]
        askedQuestions.append(currentQuestion)
        displayedQuestion = questions[randomQuestionIndex]
        questionLabel.text = currentQuestion.questionText
        questions.remove(at: randomQuestionIndex)
        generateAnswerButtons(question: currentQuestion,colorSelection: colors)
    
    }

    func gameOver() {
        let alertView = UIAlertController(title: "Game Over!", message: "Your score was \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Play Again!", style: .default, handler: { action in
            self.questions = self.askedQuestions
            self.askedQuestions = []
            self.generateQuestiontext()
        })
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
        score = 0
    }
        @IBAction func resetButtonTapped(_ sender: Any) {
    
    }

    @IBAction func answerButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        if button.title(for: .normal) == displayedQuestion!.answers[(displayedQuestion!.correctAnswer)] {
            let alertView = UIAlertController(title: "Correct!", message: "You got the answer right, good job!", preferredStyle: .alert)
            score += 1
            let okAction = UIAlertAction(title: "Okay!", style: .default, handler: { action
                in
                if self.questions.count != 0 {
                self.generateQuestiontext()
                } else {
                    self.gameOver()
                }
            })
            alertView.addAction(okAction)
            
            self.present(alertView, animated: true, completion: nil)
        }else{
            let alertView = UIAlertController(title: "wrong", message: "you got the answer wrong", preferredStyle: .alert)
            self.present(alertView, animated: true, completion:  nil)
            let okAction = UIAlertAction(title: "okay!", style : .default, handler: { action in
                if self.questions.count != 0 {
                self.generateQuestiontext()
            } else {
                self.gameOver()
            }
        })
            alertView.addAction(okAction)
    
        self.present(alertView,animated: true, completion: nil)
        }
}
}
