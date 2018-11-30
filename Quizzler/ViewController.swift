//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // Variables
    
    let questions = QuestionBank()   // constant
    var currentQuestion : Question = Question(text: " ", correctAnswer: false)
    var questionIndex : Int = 0
    var pickedAnswer : Bool = false // Variable
    var currentPoint : Int = 0

    // Buttons
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }

    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        update()
        printLog()
    }
    
    func checkAnswer() {
        currentQuestion = questions.list[questionIndex]
        if (currentQuestion.answer == pickedAnswer) {
            currentPoint += 1
            ProgressHUD.showSuccess("YAY")
        } else {
            ProgressHUD.showError("YUKE")
        }
    }
    
    func update() {
        if (questionIndex < questions.getSize()-1) {
            nextQuestion()
        }else {
            popUp()
        }
    }
    
    func updateUI() {
        currentQuestion = questions.list[questionIndex]
        questionLabel.text = currentQuestion.questionText
        scoreLabel.text = String(currentPoint)
        progressLabel.text = "\(questionIndex + 1) / \(questions.getSize())"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(questions.getSize())) * CGFloat(questionIndex+1)
        
    }
    
    func nextQuestion() {
        checkAnswer()
        questionIndex += 1
        updateUI()
        
    }
    
    func popUp() {
        let alert = UIAlertController(title: "Goob job!", message: "You have finished the quiz. Do you want to start over?", preferredStyle: .alert);
        let restartAction = UIAlertAction(title: "restart", style: .default, handler:
        { (UIAlertAction) in
            self.startOver()
        })
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
    
    func startOver() {
        currentPoint = 0
        questionIndex = 0
        updateUI()
    }
    
    func printLog() {
        let tmp : Bool = currentQuestion.answer
        print("Index: \(questionIndex) - Answer: \(pickedAnswer) - Correct Answer: \(tmp)")
    }
    
}
