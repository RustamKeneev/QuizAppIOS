//
//  ResultViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 22/9/21.
//

import Foundation
import RealmSwift

protocol ResultDelagate: AnyObject {
    func showAllData(
        category: String,
        correntAnswer: String,
        result: String,
        difficulty: String
    )
}

class ResultViewModel {
    
    private var realm: Realm? = nil
    
    var model: GameResponse? = nil
    var rightAnswerCount: Int = 0
    var category: String = String()
    var gameModel: GameModel = GameModel()
    
    private weak var delegate: ResultDelagate? = nil
    
    init(delegate: ResultDelagate) {
        self.delegate = delegate
        
        try! realm = Realm()
    }
    
    func showResult() {
        let history = HistoryModel()
        
        history.category = category
        history.correntAnswer = String(rightAnswerCount)
        history.countAnswer = String(model?.results.count ?? 0)
        history.result = "\((rightAnswerCount * 100) / (model?.results.count ?? 0))%"
        history.difficulty = gameModel.dificulty ?? String()
        history.categoryType = String(gameModel.category ??  0)
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        history.date = formatter.string(from: date)

        try! realm?.write {
            realm?.add(history)
        }
        
        delegate?.showAllData(
            category: "Category: \(category)",
            correntAnswer: "Correct answers:\n\(model?.results.count ?? 0)/\(rightAnswerCount)",
            result: "Result:\n\((rightAnswerCount * 100) / (model?.results.count ?? 0))%",
            difficulty: "Difficulty:\n\(gameModel.dificulty ?? String())"
        )
    }
}
