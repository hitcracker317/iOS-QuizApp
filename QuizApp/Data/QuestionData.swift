//
//  QuestionData.swift
//  QuizApp
//
//  Created by MaedaAkira on 2017/06/12.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import Foundation

class QuestionData {
    var questionNumber:Int = 0
    
    var question:String
    
    var answer1:String
    var answer2:String
    var answer3:String
    var answer4:String
    
    var selectedAnwswer:String
    var correctAnswer:String
    
    init(questionDataArray: [String]){
        question = questionDataArray[0]
        
        answer1 = questionDataArray[1]
        answer2 = questionDataArray[2]
        answer3 = questionDataArray[3]
        answer4 = questionDataArray[4]
        
        selectedAnwswer = ""
        correctAnswer = questionDataArray[5]
    }
    
    func isCorrect() -> Bool {
        //正誤判定
        if selectedAnwswer == correctAnswer {
            return true
        } else {
            return false
        }
    }
    
    
}
