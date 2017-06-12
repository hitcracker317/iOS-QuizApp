//
//  StartViewController.swift
//  QuizApp
//
//  Created by MaedaAkira on 2017/06/09.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuestionDataManager.sharedInstance.loadQuestion()
        
        let questionViewController = segue.destination as! QuestionViewController
        let questionData = QuestionDataManager.sharedInstance.loadNextQuestion()
        questionViewController.question = questionData
        QuestionDataManager.sharedInstance.correctCount = 0
    }
    
}

