//
//  GameModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation

class GameModel {
    
    var questions: Int? = nil
    var dificulty: String? = nil
    var category: Int? = nil
    
    func isStart() -> Bool {
        return questions != nil && dificulty != nil && category != nil
    }
}
