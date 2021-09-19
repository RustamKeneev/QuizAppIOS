//
//  GameController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation
import UIKit
import SnapKit

class GameController: UIViewController {
    
    public static func newInstance(category: String, model: GameResponse) -> GameController {
        let viewController = GameController()
        viewController.title = category
        viewController.viewModel.gameReposnse = model
        return viewController
    }
    
    private lazy var viewModel: GameViewModel = {
        return GameViewModel(delegate: self)
    }()
    
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.progressTintColor = .init(hex: "#BE52F2")
        return view
    }()
    private lazy var questionCount: UILabel = {
       let view = UILabel()
        view.text = "5/10"
        view.textColor = .init(hex: "#000000")
        return view
    }()
    
    private lazy var question: UILabel = {
        let view = UILabel()
        view.text = "What is the largest city and commercial capital of Sri Lanka?"
        view.numberOfLines = 4
        view.textColor = .init(hex: "#1A051D")
        view.textAlignment = .center
        return view
    }()
    
    private lazy var firstAnswer: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitle("Colombo", for: .normal)
        view.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        view.layer.cornerRadius = 6
        view.addTarget(self, action: #selector(nextQuestionsClick), for: .touchUpInside)
        view.backgroundColor = .init(hex: "#6979F8")
        return view
    }()
    
    private lazy var secondAnswer: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitle("Moratuwa", for: .normal)
        view.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        view.layer.cornerRadius = 6
        view.addTarget(self, action: #selector(nextQuestionsClick), for: .touchUpInside)
        view.backgroundColor = .init(hex: "#6979F8")
        return view
    }()
    
    private lazy var thirdAnswer: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitle("Negombo", for: .normal)
        view.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        view.layer.cornerRadius = 6
        view.addTarget(self, action: #selector(nextQuestionsClick), for: .touchUpInside)
        view.backgroundColor = .init(hex: "#6979F8")
        return view
    }()
    
    private lazy var fourthAnswer: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitle("Kandy", for: .normal)
        view.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        view.layer.cornerRadius = 6
        view.addTarget(self, action: #selector(nextQuestionsClick), for: .touchUpInside)
        view.backgroundColor = .init(hex: "#6979F8")
        return view
    }()
    
    private lazy var skip: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitle("Skip", for: .normal)
        view.setTitleColor(UIColor.init(hex: "#FFFFFF"), for: .normal)
        view.layer.cornerRadius = 20
        view.backgroundColor = .init(hex: "#FF6581")
        view.addTarget(self, action: #selector(result), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeArea.top).offset(30)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
        }
        
        view.addSubview(questionCount)
        questionCount.snp.makeConstraints { (make) in
            make.centerX.equalTo(progressView)
            make.top.equalTo(progressView.snp.bottom).offset(4)
        }
        
        view.addSubview(question)
        question.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(questionCount.snp.bottom).offset(30)
        }
        
        view.addSubview(firstAnswer)
        firstAnswer.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(51)
            make.right.equalToSuperview().offset(-44)
            make.top.equalTo(question.snp.bottom).offset(43)
        }
        
        view.addSubview(secondAnswer)
        secondAnswer.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(51)
            make.right.equalToSuperview().offset(-44)
            make.top.equalTo(firstAnswer.snp.bottom).offset(6)
        }
        
        view.addSubview(thirdAnswer)
        thirdAnswer.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(51)
            make.right.equalToSuperview().offset(-44)
            make.top.equalTo(secondAnswer.snp.bottom).offset(6)
        }
        
        view.addSubview(fourthAnswer)
        fourthAnswer.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(51)
            make.right.equalToSuperview().offset(-44)
            make.top.equalTo(thirdAnswer.snp.bottom).offset(6)
        }
        
        view.addSubview(skip)
        skip.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeArea.bottom).offset(-30)
        }
        
        viewModel.setup()
    }
    
    @objc func nextQuestionsClick(view: UIButton) {
        viewModel.nextQuestions()
    }
    
    @objc func result() {
        
    }
}

extension GameController: GameDelegate {
    func nextQuestions(model: GameItemResponse?) {
        question.text = model?.question
        
        firstAnswer.setTitle(model?.incorrect_answers[0], for: .normal)
        secondAnswer.setTitle(model?.incorrect_answers[1], for: .normal)
        thirdAnswer.setTitle(model?.incorrect_answers[2], for: .normal)
        fourthAnswer.setTitle(model?.incorrect_answers[3], for: .normal)
    }
    
    func showQuestionsCount(questionsCount: Int, currentIndex: Int) {
        //progressView.progress = (Float(questionsCount) - Float(currentIndex)) / 100.0 TO-DO
        self.questionCount.text = "\(questionsCount)/\(currentIndex)"
    }
    
    func showResult() {
        navigationController?.pushViewController(ResultViewController(), animated: true)
    }
}
