//
//  ProfileCell.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 2/10/21.
//

import Foundation
import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
    
    private var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#EEEEEE")
        return view
    }()
    
    private var title: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#333333")
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(separator)
        separator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(title)
        title.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    func fill(_ model: ProfileModel) {
        title.text = model.title
    }
}
