//
//  MainViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation

protocol MainDelegate: AnyObject {
    func startGame(category: String, gameModel: GameResponse)
    func showError(message: String)
    
    func setupCatogory(category: [String])
}

class MainViewModel {
    
    private weak var delegate: MainDelegate? = nil

    private var gameModel: GameModel = GameModel()
    private var catogory: CategoryResponse? = nil
    
    private var titleCatogory = String()
    
    init(delegate: MainDelegate) {
        self.delegate = delegate
    }
    
    func getCatogory() {
        ApiClient.shared.getCategory(completionHandler: { data, error in
            if data != nil {
                self.catogory = data
                
                DispatchQueue.main.async {
                    var stringCatogorys: [String] = []
                    
                    self.catogory?.trivia_categories.forEach { item in stringCatogorys.append(item.name ?? String()) }
                    
                    self.delegate?.setupCatogory(category: stringCatogorys)
                }
            } else {
                DispatchQueue.main.async {
                    self.delegate?.showError(message: "Catogory data is not parse")
                }
            }
        })
    }
    
    func sendQuestions(questions: Int) {
        gameModel.questions = questions
    }
    
    func sendDificulty(dificulty: String) {
        gameModel.dificulty = dificulty
    }
    
    func sendCategory(category: String) {
        titleCatogory = category
        
        self.catogory?.trivia_categories.forEach { item in
            if item.name == category {
                gameModel.category = item.id
            }
        }
    }

    func startGame() {
        if gameModel.isStart() {
            ApiClient.shared.getGame(gameModel: gameModel, completionHandler: {
                data, error in
                if let data = data {
                    dump(data)
                    
                    DispatchQueue.main.async {
                        self.delegate?.startGame(category: self.titleCatogory, gameModel: data)
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
