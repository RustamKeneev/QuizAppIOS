//
//  ViewController.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import UIKit
import SnapKit
import DropDown

class MainController: UIViewController {
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel(delegate: self)
    }()
    
    private lazy var mainImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "AR_Tut"))
        return view
    }()
    
    private lazy var questionsAmount: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#A9A9A9")
        view.text = LocalizationUtils.questionsAmount
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var questionsAmountCount: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#3F3356")
        view.text = "1"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    
    private lazy var slider: UISlider = {
        let view = UISlider()
        view.tintColor = .init(hex: "#BE52F2")
        view.thumbTintColor = .init(hex: "#BE52F2")
        view.maximumValue = 50
        view.minimumValue = 1
        view.value = 1
        view.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        return view
    }()
    
    private lazy var category: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#A9A9A9")
        view.text = "Category"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var categoryButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.setTitleColor(.black, for: .normal)
        view.setTitle("All", for: .normal)
        view.backgroundColor = .init(hex: "#FFFFFF")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 6
        view.contentHorizontalAlignment = .left
        view.addTarget(self, action: #selector(changeCategoryClick), for: .touchUpInside)
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return view
    }()
    
    private lazy var categoryView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var categoryList: DropDown = {
        let dropDown = DropDown()
        return dropDown
    }()
    
    private lazy var difficulty: UILabel = {
        let view = UILabel()
        view.textColor = .init(hex: "#A9A9A9")
        view.text = "Difficulty"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var difficultyButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.setTitleColor(.black, for: .normal)
        view.setTitle("easy", for: .normal)
        view.backgroundColor = .init(hex: "#FFFFFF")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 6
        view.contentHorizontalAlignment = .left
        view.addTarget(self, action: #selector(changeDifficultyClick), for: .touchUpInside)
        view.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return view
    }()
    
    private lazy var difficultyView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var difficultyList: DropDown = {
        let dropDown = DropDown()
        dropDown.dataSource = ["easy", "medium", "hard"]
        return dropDown
    }()
    
    private lazy var startButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.setTitleColor(.white, for: .normal)
        view.setTitle("START", for: .normal)
        view.backgroundColor = .init(hex: "#6979F8")
        view.layer.cornerRadius = 6
        view.addTarget(self, action: #selector(startGameClick), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        title = "Quiz"
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(75)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeArea.top).offset(20)
        }
        
        view.addSubview(questionsAmount)
        questionsAmount.snp.makeConstraints { (make) in
            make.top.equalTo(mainImage.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(67)
        }
        
        view.addSubview(questionsAmountCount)
        questionsAmountCount.snp.makeConstraints { (make) in
            make.top.equalTo(mainImage.snp.bottom).offset(30)
            make.left.equalTo(questionsAmount.snp.right).offset(2)
        }
                
        view.addSubview(slider)
        slider.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(67)
            make.right.equalToSuperview().offset(-67)
            make.top.equalTo(questionsAmount.snp.bottom).offset(9)
        }
        
        view.addSubview(category)
        category.snp.makeConstraints { (make) in
            make.top.equalTo(slider.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(67)
        }
        
        view.addSubview(categoryButton)
        categoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(category.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(67)
            make.right.equalToSuperview().offset(-67)
            make.height.equalTo(38)
        }
        
        view.addSubview(categoryView)
        categoryView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(categoryButton)
        }
        
        categoryList.anchorView = categoryView
        categoryList.selectionAction = { [unowned self] (index, item) in
            viewModel.sendCategory(category: item)
            
            categoryButton.setTitle(item, for: .normal)
        }
        
        view.addSubview(difficulty)
        difficulty.snp.makeConstraints { (make) in
            make.top.equalTo(categoryButton.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(67)
        }
        
        view.addSubview(difficultyButton)
        difficultyButton.snp.makeConstraints { (make) in
            make.top.equalTo(difficulty.snp.bottom).offset(9)
            make.left.equalToSuperview().offset(67)
            make.right.equalToSuperview().offset(-67)
            make.height.equalTo(38)
        }
        
        view.addSubview(difficultyView)
        difficultyView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(difficultyButton)
        }
        
        difficultyList.anchorView = difficultyView
        difficultyList.selectionAction = { [unowned self] (index, item) in
            viewModel.sendDificulty(dificulty: item)

            difficultyButton.setTitle(item, for: .normal)
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(87)
            make.right.equalToSuperview().offset(-87)
            make.height.equalTo(38)
            make.bottom.equalTo(view.safeArea.bottom).offset(-80)
        }
        
        viewModel.getCatogory()
    }
    
    @objc func changeValue(view: UISlider) {
        viewModel.sendQuestions(questions: Int(view.value))
        
        questionsAmountCount.text = String(Int(view.value))
    }
    
    @objc func changeCategoryClick(view: UIButton) {
        categoryList.show()
    }
    
    @objc func changeDifficultyClick(view: UIButton) {
        difficultyList.show()
    }
    
    @objc func startGameClick(view: UIButton) {
        viewModel.startGame()
    }
}

extension MainController: MainDelegate {
    func startGame(category: String, gameModel: GameResponse, model: GameModel) {
        navigationController?.pushViewController(GameController.newInstance(category: category, model: gameModel, gameModel: model), animated: true)
    }
    
    func setupCatogory(category: [String]) {
        self.categoryButton.setTitle(category[0], for: .normal)
        
        viewModel.sendCategory(category: category[0])
        viewModel.sendQuestions(questions: 1)
        viewModel.sendDificulty(dificulty: "easy")
        
        categoryList.dataSource = category
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: {_ in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
