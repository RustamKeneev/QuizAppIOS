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
        
//        tabBar.barTintColor = UIColor.init(hex: "BE52F2")
        tabBar.tintColor = UIColor.init(hex: "BE52F2")
//        tabBar.unselectedItemTintColor = UIColor.init(hex: "BE52F2")
        
        tabBar.items?[0].image = UIImage(named: "start_game")
        tabBar.items?[1].image = UIImage(named: "history")
        tabBar.items?[2].image = UIImage(named: "profile")
    }
}
