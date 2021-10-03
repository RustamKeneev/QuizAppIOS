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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = history?[indexPath.row]
        
        let alert = UIAlertController(title: "Alert", message: "Start game?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {_ in
            if let model = model {
                self.viewModel.startGame(model: model)
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {_ in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
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
    func showError(message: String) {
        print(message)
    }
    
    func startGame(category: String, gameModel: GameResponse, model: GameModel) {
        navigationController?.pushViewController(GameController.newInstance(category: category, model: gameModel, gameModel: model), animated: true)
    }
    
    func showHistory(history: Results<HistoryModel>?) {
        self.history = history
        
        self.historyTableView.reloadData()
    }
}
