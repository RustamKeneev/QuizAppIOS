//
//  GameItemResponse.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation

class GameItemResponse: Codable {
    var question: String? = nil
    var correct_answer: String? = nil
    var incorrect_answers: [String] = []
}
