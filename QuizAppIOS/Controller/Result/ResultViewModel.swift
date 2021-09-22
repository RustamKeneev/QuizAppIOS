//
//  ResultViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 22/9/21.
//

import Foundation

protocol ResultDelagate: AnyObject {
    func showAllData(
        category: String,
        correntAnswer: String,
        result: String,
        difficulty: String
    )
}

class ResultViewModel {
    
    var model: GameResponse? = nil
    var rightAnswerCount: Int = 0
    var category: String = String()
    var gameModel: GameModel = GameModel()
    
    private weak var delegate: ResultDelagate? = nil
    
    init(delegate: ResultDelagate) {
        self.delegate = delegate
    }
    
    func showResult() {
        delegate?.showAllData(
            category: "Category: \(category)",
            correntAnswer: "Correct answers:\n\(model?.results.count ?? 0)/\(rightAnswerCount)",
            result: "Result:\n\((rightAnswerCount * 100) / (model?.results.count ?? 0))%",
            difficulty: "Difficulty:\n\(gameModel.dificulty ?? String())"
        )
    }
}
