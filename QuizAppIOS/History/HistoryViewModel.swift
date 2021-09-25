//
//  HistoryViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 24/9/21.
//

import Foundation
import UIKit

protocol HistoryDelegate: AnyObject {
    func loadHistory()
}

class HistoryViewModel {
    var history: [TestModel] = []
    weak var delegate: HistoryDelegate?
    
    init(delegate: HistoryDelegate) {
        self.delegate = delegate
    }
    
       func fetchHistory() {
        history.append(TestModel(categoryLabel: "Category:", categoryTitle: " Mixed", correctAnswers: "Correct answers: ", correctAnswersTitle: "8/10",  difficultyLabel: "Difficulty", difficultyTitle: "Easy", date: "12 may 2019 20:32"))
        
        history.append(TestModel(categoryLabel: "Category:", categoryTitle: " Mixed", correctAnswers: "Correct answers: ", correctAnswersTitle: "8/10",  difficultyLabel: "Difficulty", difficultyTitle: "Easy", date: "12 may 2019 20:32"))
        
        history.append(TestModel(categoryLabel: "Category:", categoryTitle: " Mixed", correctAnswers: "Correct answers: ", correctAnswersTitle: "8/10",  difficultyLabel: "Difficulty", difficultyTitle: "Easy", date: "12 may 2019 20:32"))
        delegate?.loadHistory()
       }
}
