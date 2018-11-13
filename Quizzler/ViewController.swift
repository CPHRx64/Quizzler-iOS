//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let questions = QuestionBank()   // constant
    var pickedAnswer : Bool = false // Variable
    var questionNr : Int = 0
    var currentPoint : Int = 0


    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = questions.list[questionNr]
        questionLabel.text = currentQuestion.questionText
        scoreLabel.text = String(0)
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        updateUI()

    }
    
    
    
    func updateUI() {
        scoreLabel.text = String(currentPoint)
        if (questionNr < questions.getSize()) {
            nextQuestion()
        }else {
            startOver()
        }
    }
    

    func nextQuestion() {
        questionNr += 1
        questionLabel.text = questions.list[questionNr].questionText
    }
    
    
    func checkAnswer() {
        let firstQuestion = questions.list[0]
        if (firstQuestion.answer == pickedAnswer) {
            currentPoint += 1
            print("yay")
        }else {
            print("yuke")
        }
        questionNr += 1
    }
    
    
    func startOver() {
        questionNr = 0
        questionLabel.text = questions.list[questionNr].questionText
    }
    

    
}
