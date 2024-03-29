//
//  GameViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation

protocol GameDelegate: AnyObject {
    func nextQuestions(model: GameItemResponse?)
    func showQuestionsCount(questionsCount: Int, currentIndex: Int)
    func showResult(model: GameResponse?, rightAnswerCount: Int, gameModel: GameModel)
    func showRightAnswer(answer: String)
    func showWrongAnswer(answer: String)
}

class GameViewModel {
    
    private weak var delegate: GameDelegate? = nil

    var gameReposnse: GameResponse? = nil
    var gameModel: GameModel = GameModel()
    
    private var currentAnsver: String? = nil
    
    private var questionsCount: Int = 0
    private var questionsCurrentIndex: Int = 0
    
    private var rightAnswerCount: Int = 0
    
    init(delegate: GameDelegate) {
        self.delegate = delegate
    }
    
    func nextQuestions() {
        if (questionsCurrentIndex + 1) < questionsCount {
            questionsCurrentIndex = questionsCurrentIndex + 1
            
            questionsCount = gameReposnse?.results.count ?? 0
            
            currentAnsver = gameReposnse?.results[questionsCurrentIndex].correct_answer
            
            delegate?.showQuestionsCount(questionsCount: questionsCount, currentIndex: questionsCurrentIndex + 1)
            
            gameReposnse?.results[questionsCurrentIndex].incorrect_answers.insert(currentAnsver ?? String(), at: Int.random(in: 0...3))
            delegate?.nextQuestions(model: gameReposnse?.results[questionsCurrentIndex])
        } else {
            delegate?.showResult(model: gameReposnse, rightAnswerCount: rightAnswerCount, gameModel: gameModel)
        }
    }
    
    func answerClick(answer: String) {
        let rightAnswer = gameReposnse?.results[questionsCurrentIndex].correct_answer ?? String()
        
        if answer == rightAnswer {
            rightAnswerCount += 1
            
            delegate?.showRightAnswer(answer: answer)
        } else {
            delegate?.showWrongAnswer(answer: answer)
        }
    }
    
    func setup() {
        questionsCount = gameReposnse?.results.count ?? 0
        
        currentAnsver = gameReposnse?.results[questionsCurrentIndex].correct_answer
        
        delegate?.showQuestionsCount(questionsCount: questionsCount, currentIndex: questionsCurrentIndex + 1)
        
        gameReposnse?.results[questionsCurrentIndex].incorrect_answers.insert(currentAnsver ?? String(), at: Int.random(in: 0...3))
        delegate?.nextQuestions(model: gameReposnse?.results[questionsCurrentIndex])
    }
}
