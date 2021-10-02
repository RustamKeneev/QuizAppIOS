//
//  HistoryCell.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 25/9/21.
//

import Foundation
import UIKit
import SnapKit

class HistoryCell: UITableViewCell {
    
    private lazy var category: UILabel = {
        let view = UILabel()
        view.text = "test"
        view.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private lazy var correntAnswers: UILabel = {
        let view = UILabel()
        view.text = "test"
        view.font = UIFont.systemFont(ofSize: 12)
        view.textColor = .init(hex: "#1F2041")
        return view
    }()
    
    private lazy var difiticaty: UILabel = {
        let view = UILabel()
        view.text = "test"
        view.font = UIFont.systemFont(ofSize: 12)
        view.textColor = .init(hex: "#1F2041")
        return view
    }()
    
    private lazy var date: UILabel = {
        let view = UILabel()
        view.text = "12 may 2019 20:32"
        view.font = UIFont.systemFont(ofSize: 9)
        view.textColor = .init(hex: "#1F2041")
        return view
    }()
    
    private lazy var containtView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 4
        return view
    }()
    
    func fill(_ model: HistoryModel) {
        category.text = "Category: \(model.category ?? String())"
        correntAnswers.text = "Correct answers: \(model.correntAnswer ?? String())/\(model.countAnswer ?? String())"
        difiticaty.text = "Difficulty: \(model.difficulty ?? String())"
        
        date.text = model.date ?? String()
    }
    
    override func layoutSubviews() {
        addSubview(containtView)
        containtView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
        }
        
        containtView.addSubview(category)
        category.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        containtView.addSubview(correntAnswers)
        correntAnswers.snp.makeConstraints { (make) in
            make.top.equalTo(category.snp.bottom).offset(13)
            make.left.equalToSuperview().offset(16)
        }
        
        containtView.addSubview(difiticaty)
        difiticaty.snp.makeConstraints { (make) in
            make.top.equalTo(correntAnswers.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(16)
        }
        
        containtView.addSubview(date)
        date.snp.makeConstraints { (make) in
            make.top.equalTo(correntAnswers.snp.bottom).offset(9)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
