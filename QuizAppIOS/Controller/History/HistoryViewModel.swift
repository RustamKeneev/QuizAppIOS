//
//  HistoryViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import RealmSwift

protocol HistoryDelegate {
    func showHistory(history: Results<HistoryModel>?)
    func showError(message: String)

    func startGame(category: String, gameModel: GameResponse, model: GameModel)
}

class HistoryViewModel {

    private var realm: Realm? = nil
    
    private var delegate: HistoryDelegate? = nil
    
    init(delegate: HistoryDelegate) {
        self.delegate = delegate
        
        try! realm = Realm()
    }
    
    func showHistory() {        
        delegate?.showHistory(history: realm?.objects(HistoryModel.self))
    }
    
    func startGame(model: HistoryModel) {
        var gameModel: GameModel = GameModel()
        
        gameModel.questions = Int(model.countAnswer ?? "0")
        gameModel.category = Int(model.categoryType ?? "0")
        gameModel.dificulty = model.difficulty ?? ""
        
        if gameModel.isStart() {
            ApiClient.shared.getGame(gameModel: gameModel, completionHandler: {
                data, error in
                if let data = data {
                    dump(data)
                    
                    DispatchQueue.main.async { [self] in
                        self.delegate?.startGame(category: model.category ?? String(), gameModel: data, model: gameModel)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.delegate?.showError(message: "Game data is not parse")
                    }
                }
            })
            
        } else {
            delegate?.showError(message: "Game is not valid")
        }
    }
}

