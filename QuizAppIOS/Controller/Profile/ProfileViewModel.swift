//
//  ProfileViewModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import RealmSwift

protocol ProfileDelegate: AnyObject {
    func showData()
}

class ProfileViewModel {
    
    private weak var delegate: ProfileDelegate? = nil
    
    private var realm: Realm? = nil
    
    public let profileList = [
        ProfileModel(title: "Clear", type: .clear),
        ProfileModel(title: "Share", type: .share)
    ]
    
    init(delegate: ProfileDelegate) {
        self.delegate = delegate
        
        try! realm = Realm()
    }
    
    func showProfile() {
        delegate?.showData()
    }
    
    func removeHistory() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
