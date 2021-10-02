//
//  HistoryModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import RealmSwift

class HistoryModel: Object {
    @objc dynamic var category: String? = nil
    @objc dynamic var correntAnswer: String? = nil
    @objc dynamic var countAnswer: String? = nil
    @objc dynamic var result: String? = nil
    @objc dynamic var difficulty: String? = nil
    
    @objc dynamic var date: String? = nil
}
