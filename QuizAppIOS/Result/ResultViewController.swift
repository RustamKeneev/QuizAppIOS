//
//  ResultViewController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation
import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
    private lazy var resultImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "result_done"))
        return view
    }()
    
    private lazy var resultView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 6
        view.backgroundColor  = .init(hex: "#FFFFFF")
        return view
    }()
    
    private lazy var finishButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitle("Finish", for: .normal)
        view.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        view.layer.cornerRadius = 20
        view.addTarget(self, action: #selector(filishClick(view:)), for: .touchUpInside)
        view.backgroundColor = .init(hex: "#4CE2A7")
        return view
    }()
    
    private lazy var resultСategory: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#1F2041")
        view.text = "Category: Mixed"
        view.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return view
    }()
    
    private lazy var dificultyResult: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#1F2041")
        view.text = "Difficulty:\nAll"
        view.textAlignment = .center
        view.numberOfLines = 2
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var answersResult: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#1F2041")
        view.text = "Correct answers:\n8/10"
        view.textAlignment = .center
        view.numberOfLines = 2
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()

    private lazy var percentResult: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#1F2041")
        view.text = "Result:\n80%"
        view.textAlignment = .center
        view.numberOfLines = 2
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()

    override func viewDidLoad() {
        title = "Result"
        view.backgroundColor = .white
        
        navigationItem.hidesBackButton = true
        
        view.addSubview(resultImage)
        resultImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeArea.top).offset(30)
        }
        
        view.addSubview(resultView)
        resultView.snp.makeConstraints { (make) in
            make.width.equalTo(342)
            make.height.equalTo(200)
            make.centerY.equalTo(view.safeArea.centerY)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(finishButton)
        finishButton.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom).offset(-30)
        }
        
        resultView.addSubview(resultСategory)
        resultСategory.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(resultView.safeArea.top).offset(20)
        }
        
        resultView.addSubview(dificultyResult)
        dificultyResult.snp.makeConstraints { (make) in
            make.left.equalTo(resultView.snp.left).offset(35)
            make.top.equalTo(resultView.safeArea.top).offset(81)
        }
        
        resultView.addSubview(answersResult)
        answersResult.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(resultView.safeArea.top).offset(81)
        }
        
        resultView.addSubview(percentResult)
        percentResult.snp.makeConstraints { (make) in
//            make.left.equalTo(resultView.snp.left).offset(150)
            make.right.equalTo(resultView.snp.right).offset(-35)
            make.top.equalTo(resultView.safeArea.top).offset(81)
        }
    }
    
    @objc func filishClick(view: UIButton) {
        navigationController?.pushViewController(MainController(), animated: true)
    }
}
