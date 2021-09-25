//
//  MainController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import UIKit

class MainController: UITabBarController {
    
    override func viewDidLoad() {
        title = "Quiz"
        navigationItem.hidesBackButton = true

        var start = StartGameController()
        var history = HistoryController()
        var profile = ProfileController()

        start.title = "Start"
        history.title = "History"
        profile.title = "Profile"
        
        viewControllers = [
            start, history, profile
        ]
    }
}
