//
//  LocalizationUtils.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 22/9/21.
//

import Foundation

class LocalizationUtils {
    
    private static var storage = UserDefaults.standard
    
    static var language: Language {
        get {
            Language.init(rawValue: storage.string(forKey: "language") ?? "RU") ?? Language.ru
        }
        set {
            storage.setValue(newValue, forKey: "language")
        }
    }
    
    static var questionsAmount: String {
        get {
            switch LocalizationUtils.language {
            case .ru:
                return "Количество вопросов: "
            case .eng:
                return "Questions amount: "
            }
        }
    }
    
}
