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
    
    public static func newInstance(category: String, model: GameResponse, gameModel: GameModel) -> GameController {
        let viewController = GameController()
        viewController.title = category
        viewController.viewModel.gameModel = gameModel
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
    
    private lazy var buttonContaner: UIView = {
        return UIView()
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
        
        view.addSubview(buttonContaner)
        buttonContaner.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(40 + 8 + 40 + 8 + 40 + 8 + 40)
        }
        
        buttonContaner.addSubview(firstAnswer)
        firstAnswer.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        buttonContaner.addSubview(secondAnswer)
        secondAnswer.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(firstAnswer.snp.bottom).offset(8)
        }
        
        buttonContaner.addSubview(thirdAnswer)
        thirdAnswer.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(secondAnswer.snp.bottom).offset(8)
        }
        
        buttonContaner.addSubview(fourthAnswer)
        fourthAnswer.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(thirdAnswer.snp.bottom).offset(8)
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
        viewModel.answerClick(answer: view.titleLabel?.text ?? String())
    }
    
    @objc func result() {
        viewModel.nextQuestions()
    }
}

extension GameController: GameDelegate {
    func showResult(model: GameResponse?, rightAnswerCount: Int, gameModel: GameModel) {
        navigationController?.pushViewController(ResultViewController.newInstanse(model: model, rightAnswerCount: rightAnswerCount, category: self.title ?? String(), gameModel: gameModel), animated: true)
    }
    
    func showRightAnswer(answer: String) {
        if firstAnswer.titleLabel?.text == answer {
            firstAnswer.backgroundColor = .green
        }
        
        if secondAnswer.titleLabel?.text == answer {
            secondAnswer.backgroundColor = .green
        }
        
        if thirdAnswer.titleLabel?.text == answer {
            thirdAnswer.backgroundColor = .green
        }
        
        if fourthAnswer.titleLabel?.text == answer {
            fourthAnswer.backgroundColor = .green
        }
        
        DispatchQueue.global().async {
            sleep(1)
            
            DispatchQueue.main.async {
                self.viewModel.nextQuestions()
            }
        }
    }
    
    func showWrongAnswer(answer: String) {
        if firstAnswer.titleLabel?.text == answer {
            firstAnswer.backgroundColor = .red
        }
        
        if secondAnswer.titleLabel?.text == answer {
            secondAnswer.backgroundColor = .red
        }
        
        if thirdAnswer.titleLabel?.text == answer {
            thirdAnswer.backgroundColor = .red
        }
        
        if fourthAnswer.titleLabel?.text == answer {
            fourthAnswer.backgroundColor = .red
        }
        
        DispatchQueue.global().async {
            sleep(1)
            
            DispatchQueue.main.async {
                self.viewModel.nextQuestions()
            }
        }
    }
    
    func nextQuestions(model: GameItemResponse?) {
        firstAnswer.backgroundColor = .init(hex: "#6979F8")
        secondAnswer.backgroundColor = .init(hex: "#6979F8")
        thirdAnswer.backgroundColor = .init(hex: "#6979F8")
        fourthAnswer.backgroundColor = .init(hex: "#6979F8")

        question.text = model?.question
        
        firstAnswer.setTitle(model?.incorrect_answers[0], for: .normal)
        secondAnswer.setTitle(model?.incorrect_answers[1], for: .normal)
        thirdAnswer.setTitle(model?.incorrect_answers[2], for: .normal)
        fourthAnswer.setTitle(model?.incorrect_answers[3], for: .normal)
    }
    
    func showQuestionsCount(questionsCount: Int, currentIndex: Int) {
        progressView.progress = Float(currentIndex) / Float(questionsCount)
        self.questionCount.text = "\(questionsCount)/\(currentIndex)"
    }
}
