//
//  ShareThisAppCell.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 28/9/21.
//

import Foundation
import SnapKit
import UIKit

class ShareThisAppCell: UITableViewCell {
    
    private lazy var textTitle: UILabel = {
        let view = UILabel()
        view.text = "Share this app"
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return view
    }()
    
    private lazy var chevronRightImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "chevron_right")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAddSubView()
        setupMakeContraints()
    }
    
    func setupAddSubView() {
        contentView.addSubview(textTitle)
        contentView.addSubview(chevronRightImage)
    }
    
    func setupMakeContraints() {
        textTitle.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.height.equalTo(94)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
