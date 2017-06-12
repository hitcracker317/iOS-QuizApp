//
//  QuestionDataManager.swift
//  QuizApp
//
//  Created by MaedaAkira on 2017/06/12.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import Foundation

class QuestionDataManager {
    //シングルトンオブジェクト。シングルトンオブジェクトとは、アプリ起動中に1つしか存在しない唯一のオブジェクトであることを保証されたオブジェクトのこと。
    //staticをつけることで常に同一のメモリの情報を参照することになる
    //シングルトンオブジェクトは「sharedInstance」という名前で定義する慣習
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray:[QuestionData] = [] //全問題の配列
    var nowQuestionIndex:Int = 0 //現在の問題
    
    //初期化関数。シングルトンオブジェクトのため外部クラスから参照されないようにprivate修飾子を付与
    private init(){
        
    }
    
    //問題を読み込む
    func loadQuestion() {
        questionDataArray.removeAll()
        nowQuestionIndex = 0;
        
        guard let questuonFilePath = Bundle.main.path(forResource: "../quiz", ofType: "csv") else {
            print("見つからないよ！")
            return
        }
        
        do {
            let csvString = try String(contentsOfFile: questuonFilePath, encoding: String.Encoding.utf8) //ファイルの内容の文字列を取得
            
            //CSVデータを1行ずつ読み込む
            //enumerateLinesで改行ごとの処理内容を宣言
            //改行ごとの1行分のデータはline変数に格納される
            csvString.enumerateLines(invoking: {(line,stop) in
                let questionDataArray = line.components(separatedBy: ",") //カンマ区切りで分割
                let questionData = QuestionData(questionDataArray:questionDataArray) //問題に関するデータを格納
                self.questionDataArray.append(questionData) //問題を配列に追加
                questionData.questionNumber = self.questionDataArray.count //問題番号
            })
            
        } catch let error {
            print("ファイルの読み込みエラー：\(error)")
            return
        }
    }
    
    //次の問題を読み込む
    func loadNextQuestion() -> QuestionData? {
        if nowQuestionIndex < self.questionDataArray.count {
            let nextQuestion = self.questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
}
