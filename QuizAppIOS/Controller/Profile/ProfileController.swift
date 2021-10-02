//
//  ProfileController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    
    private lazy var viewModel: ProfileViewModel = {
        return ProfileViewModel(delegate: self)
    }()
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

        view.backgroundColor = .white

        view.addSubview(profileTableView)
        profileTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeArea.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}

extension ProfileController: ProfileDelegate {
    func showData() {
        profileTableView.reloadData()
    }
}

extension ProfileController: UITabBarDelegate,UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = viewModel.profileList[indexPath.row]
        
        switch model.type {
        case .clear: viewModel.removeHistory()
            break
        case .share:
            break
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.profileList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.profileList[indexPath.row]
        let cell = ProfileCell()
        
        cell.fill(model)
        
        return cell
    }
    
    
}

