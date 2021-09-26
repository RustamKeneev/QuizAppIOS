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
        view.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private lazy var correntAnswers: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var difiticaty: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var date: UILabel = {
        let view = UILabel()
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
    
    override func layoutSubviews() {
        addSubview(containtView)
        containtView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
        }
        
        addSubview(category)
        category.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
        }
    }
}
