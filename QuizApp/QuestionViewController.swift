//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by MaedaAkira on 2017/06/09.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {

    var question:QuestionData!
    
    @IBOutlet weak var questionTextNumber: UILabel!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTextNumber.text = "Q\(String(question.questionNumber))"
        questionText.text = question.question
        
        answer1Button.setTitle(question.answer1, for: UIControlState.normal)
        answer2Button.setTitle(question.answer2, for: UIControlState.normal)
        answer3Button.setTitle(question.answer3, for: UIControlState.normal)
        answer4Button.setTitle(question.answer4, for: UIControlState.normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func tapAnswer(_ sender: Any) {
        let tapbutton:UIButton = sender as! UIButton
        
        question.selectedAnwswer = (tapbutton.titleLabel?.text)! //選択した答えを保存
        checkAnswer()
    }

    func checkAnswer() {
        if question.isCorrect() {
            //正解！
            appearQuestionResult(isCorrect: true)
        } else {
            //不正解
            appearQuestionResult(isCorrect: false)
        }
    }
    
    func appearQuestionResult(isCorrect: Bool) {
        if isCorrect {
            //正解
            AudioServicesPlayAlertSound(1025)
            
            //アニメーション
            UIView.animate(withDuration: 2.0, animations: {
                self.correctImageView.alpha = 1.0
            }) { (Bool) in
                self.goNextQuestion()
            }
        } else {
            //不正解
            AudioServicesPlayAlertSound(1006)
            
            //アニメーション
            UIView.animate(withDuration: 2.0, animations: {
                self.incorrectImageView.alpha = 1.0
            }) { (Bool) in
                self.goNextQuestion()
            }
        }
    }
    
    func goNextQuestion() {
        guard let nextQuestion = QuestionDataManager.sharedInstance.loadNextQuestion() else {
            //問題文がなければ、結果画面に遷移する
            if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                present(resultViewController, animated: true, completion: nil)
            }
            return
        }
        
        //問題文がある場合は次の問題へ遷移する
        //storyboardのIdentifierで設定した値を設定してviewControllerインスタンスを作成する
        
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            nextViewController.question = nextQuestion
            
            //segueを利用しない画面遷移
            present(nextViewController, animated: true, completion: nil)
        }
        
    }
}
