//
//  ProfileController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    
    var data = [ProfileModel(model: 0),
    ProfileModel(model: 1),
    ProfileModel(model: 2),
    ProfileModel(model: 3)]
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

        
        view.backgroundColor = .white
        
        title = "Profile"
    }
    
    func configure() {
        setupAddSubviews()
        setupAddConstraints()
    }
    
    func setupAddSubviews() {
        view.addSubview(profileTableView)
    }
    
    func setupAddConstraints() {
        profileTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeArea.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
}

extension ProfileController: UITabBarDelegate,UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

