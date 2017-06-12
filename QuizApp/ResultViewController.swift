//
//  ResultViewController.swift
//  QuizApp
//
//  Created by MaedaAkira on 2017/06/09.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var questionCount:Int = 0
    var correctCount:Int = 0
    
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let percentOfCorrect:Float = calcPercentOfCorrect()
        percentLabel.text = "\(percentOfCorrect)%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func calcPercentOfCorrect() -> Float {
        let percentOfCorrect:Float = (Float(correctCount) / Float(questionCount)) * 100.0
        return percentOfCorrect
    }

    @IBAction func backTitle(_ sender: Any) {
        //タイトル画面に戻る
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
