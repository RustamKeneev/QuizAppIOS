//
//  HistoryViewController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 23/9/21.
//

import Foundation
import UIKit
import SnapKit

class HistoryViewController: UIViewController  {
    
    private lazy var viewModel: HistoryViewModel = {
        return HistoryViewModel(delegate: self)
    }()
    
    private lazy var historyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .clear
        cv.register(HistoryCell.self, forCellWithReuseIdentifier: HistoryCell.reuseIdentifierCell)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        title = "History"
        
        
        viewModel.fetchHistory()
        
        configure()
    }
    
    func configure() {
        setupAddSubViews()
        setupMakeContraints()
    }
    
    func setupAddSubViews() {
        view.addSubview(historyCollectionView)
    }
    
    func setupMakeContraints() {
        historyCollectionView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
        }
    }
}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.history.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCell.reuseIdentifierCell, for: indexPath) as! HistoryCell
        let item = viewModel.history[indexPath.row]
        cell.setupData(history: item)
        return cell
    }
    
    
}

extension HistoryViewController: HistoryDelegate {
    func loadHistory() {
        historyCollectionView.reloadData()
    }
}
