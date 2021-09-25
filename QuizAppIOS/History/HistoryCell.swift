//
//  HistoryCell.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 24/9/21.
//

import Foundation
import UIKit
import SnapKit

class HistoryCell: UICollectionViewCell {
    
    static let reuseIdentifierCell = "HistoryCellReuse"

    
    private lazy var historyUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(categoryLabel)
        view.addSubview(categoryTitle)
        view.addSubview(historyImage)
        view.addSubview(correctAnswersLabel)
        view.addSubview(correctAnswersTitle)
        view.addSubview(difficultyLabel)
        view.addSubview(difficultyTitle)
        view.addSubview(dateLabel)
        
        categoryLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
        }
        
        categoryTitle.snp.makeConstraints { (make) in
            make.top.equalTo(categoryLabel.snp.top)
            make.bottom.equalTo(categoryLabel.snp.bottom)
            make.left.equalTo(categoryLabel.snp.right).offset(5)
        }
        
        historyImage.snp.makeConstraints { (make) in
            make.top.equalTo(categoryLabel.snp.top)
            make.bottom.equalTo(categoryLabel.snp.bottom)
            make.right.equalToSuperview().offset(-16)
        }
        
        correctAnswersLabel.snp.makeConstraints { (make) in
            make.top.equalTo(categoryLabel.snp.bottom).offset(12)
            make.left.equalTo(categoryLabel.snp.left)
        }
        
        correctAnswersTitle.snp.makeConstraints { (make) in
            make.top.equalTo(correctAnswersLabel.snp.top)
            make.bottom.equalTo(correctAnswersLabel.snp.bottom)
            make.left.equalTo(correctAnswersLabel.snp.right).offset(10)
        }
        
        difficultyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(correctAnswersLabel.snp.bottom).offset(12)
            make.left.equalTo(correctAnswersLabel.snp.left)
        }
        
        difficultyTitle.snp.makeConstraints { (make) in
            make.top.equalTo(difficultyLabel.snp.top)
            make.bottom.equalTo(difficultyLabel.snp.bottom)
            make.left.equalTo(difficultyLabel.snp.right).offset(10)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-16)
        }
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.text = "Category:"
        return view
    }()
    
    private lazy var categoryTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    private lazy var historyImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(systemName: "vector_image")
        return view
    }()
    
    private lazy var correctAnswersLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        view.textColor = UIColor.init(hex: "#1F2041")
        return view
    }()
    
    private lazy var correctAnswersTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var difficultyLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var difficultyTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 10)
        return view
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupAddSubView()
            setupMakeContraints()
        }
    
   
    
    func setupAddSubView() {
        contentView.addSubview(historyUIView)
    }
    
    func setupMakeContraints()  {
        historyUIView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    func setupData(history: TestModel) {
        categoryLabel.text = "Category:"
        categoryTitle.text = "Mixed"
        correctAnswersLabel.text = "Correct answers: : "
        correctAnswersTitle.text = "8/10"
        difficultyLabel.text = "Difficulty: "
        difficultyTitle.text = "Easy"
        dateLabel.text = "12 may 2019 20:32"
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
