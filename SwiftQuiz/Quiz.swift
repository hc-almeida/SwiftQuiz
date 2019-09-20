//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Hellen Caroline on 05/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import Foundation

class Quiz {
    let question: String
    let options: [String]
    private let correctAnswer: String
    
    init(question: String, options: [String], correctAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
    // valida a resposta do usuario, pegando a opcao e devolve comparando com a opcao correta
    func validadeOption(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctAnswer
    }
    
    deinit {
        print ("Liberou quis da memoria")
    }
    
}
