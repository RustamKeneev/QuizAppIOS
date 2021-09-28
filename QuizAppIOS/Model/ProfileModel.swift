//
//  ProfileModel.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 28/9/21.
//

import Foundation
import UIKit

class ProfileModel {
    var itemText: String? = nil
    var arrowRight: Int? = nil
    
    var model: Int? = nil

    
    init(itemText: String, arrowRight: Int) {
        self.itemText = itemText
        self.arrowRight = arrowRight
    }
    
    init(model: Int) {
           self.model = model
       }
    
    init() {
        
    }
}
