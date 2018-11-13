//
//  QuestionBank.swift
//  Quizzler
//
//  Created by BenJ on 11/13/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
        let item = Question(text: "what is love", correctAnswer: true)
        list.append(item)
        
        list.append(Question(text: "1", correctAnswer: true))
    }
    
}
