//
//  HistoryController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import UIKit
import RealmSwift

class HistoryController: UIViewController {
    
    private lazy var viewModel: HistoryViewModel = {
        return HistoryViewModel(delegate: self)
    }()
    
    private lazy var historyTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        return view
    }()
    
    private var history: Results<HistoryModel>? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.showHistory()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        title = "History"
        
        view.addSubview(historyTableView)
        historyTableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeArea.top)
            make.bottom.equalTo(view.safeArea.bottom)
            make.height
        }
        
        viewModel.showHistory()
    }
}

extension HistoryController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = history?[indexPath.row]
        let cell = HistoryCell()
        
        if let data = data {
            cell.fill(data)
        }
        
        return cell
    }
}

extension HistoryController: HistoryDelegate {
    func showHistory(history: Results<HistoryModel>?) {
        self.history = history
        
        self.historyTableView.reloadData()
    }
}
