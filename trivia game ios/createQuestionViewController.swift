//
//  createQuestionViewController.swift
//  trivia game ios
//
//  Created by Americo Lopez on 3/19/18.
//  Copyright © 2018 Americo Lopez. All rights reserved.
//

import UIKit

class createQuestionViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var answerBTextfield: UITextField!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var newQuestion: Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
   
    @IBAction func addButtonTapped(_ sender: Any) {
        newQuestion = Question(questionText: questionTextView.text!, answers: [answerATextField.text! , answerBTextfield.text! ,answerCTextField.text! ,answerDTextField.text! ], correctAnswer: segmentedControl.selectedSegmentIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "guesssScreen") {
            let vc = segue.destination as! GuessViewController
            vc.questions.append(newQuestion)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
