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
}

