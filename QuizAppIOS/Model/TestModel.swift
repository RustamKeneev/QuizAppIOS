//
//  TestModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 24/9/21.
//

import Foundation

//struct TestModel: Codable {
//    var category: String? = nil
//    var correct_answer: String? = nil
//    var dificulty: String? = nil
//}

struct TestModel {
    var categoryLabel: String? = nil
    var categoryTitle: String? = nil
    var correctAnswers: String? = nil
    var correctAnswersTitle: String? = nil
    var difficultyLabel: String? = nil
    var difficultyTitle: String? = nil
    var date: String? = nil

    
    init(categoryLabel: String,categoryTitle: String, correctAnswers: String, correctAnswersTitle: String, difficultyLabel: String, difficultyTitle: String, date: String) {
        self.categoryLabel = categoryLabel
        self.correctAnswers = correctAnswers
        self.correctAnswersTitle = correctAnswersTitle
        self.difficultyLabel = difficultyLabel
        self.difficultyTitle = difficultyTitle
        self.date = date
    }
    
}
