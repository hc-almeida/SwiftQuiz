//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Hellen Caroline on 05/09/19.
//  Copyright © 2019 Hellen Caroline. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView! //viewtime
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //metodo chamado quando troca de tela
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //animacao de tempo
        viTimer.frame.size.width = view.frame.size.width //coloca o tamanho da viTime msm q da view
        UIView.animate(withDuration: 30.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResult()
        }
        getNewQuiz()
    }
    
    func getNewQuiz() {
        //chama o quizManager e joga uma question automaticamente dentro do lbQuestion
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count { //verifica
            let option = quizManager.options[i]
            let button = btAnswers[i]
            
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResult() {
        performSegue(withIdentifier: "ResultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewcontroller = segue.destination as! ResultViewController
        resultViewcontroller.totalAnswer = quizManager.totalAnswer
        resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswer
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)! //pega indice do button clicado joga no index
        quizManager.validateAnswer(index: index) //chama o quiz e valida a resposta do usuario
        getNewQuiz()
    }
    
    

}
