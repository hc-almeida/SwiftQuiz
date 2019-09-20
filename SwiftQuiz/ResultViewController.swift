//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Hellen Caroline on 05/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    
    @IBOutlet weak var lbCorret: UILabel!
    
    @IBOutlet weak var lbWrong: UILabel!
    
    @IBOutlet weak var lbScore: UILabel!
    
    //valores que serao apresentados na tela de resultado, é necessario as variaveis p acessar os valores
    var totalCorrectAnswers: Int = 0
    var totalAnswer: Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //atualiza os valores dos label's
        lbAnswered.text = "Perguntas respondidas: \(totalAnswer)"
        lbCorret.text = "Perguntas corretas: \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas erradas: \(totalAnswer - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers*100/totalAnswer
        lbScore.text = "\(score)%"
    }
    
    //fecha a tela
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
