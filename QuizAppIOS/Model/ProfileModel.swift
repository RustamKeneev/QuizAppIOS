//
//  ProfileModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 28/9/21.
//

import Foundation
import UIKit

class ProfileModel {
    var title: String
    var type: TypeProfileModel
    
    init(title: String, type: TypeProfileModel) {
        self.title = title
        self.type = type
    }
}

enum TypeProfileModel {
    case clear
    case share
}
