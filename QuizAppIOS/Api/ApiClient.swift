//
//  ApiClient.swift
//  QuizAppIOS
//
//  Created by Rustam Keneev on 19/9/21.
//

import Foundation
class ApiClient {
    
    public static var shared = ApiClient()

    private let urlSession = URLSession.shared
    
    private let CATEGORY_URL = "https://opentdb.com/api_category.php"
    
    private func createGameURL(gameModel: GameModel) -> URLRequest {
        return URLRequest(url: URL(string: "https://opentdb.com/api.php?amount=\(gameModel.questions ?? 1)&category=\(gameModel.category ?? 1)&difficulty=\(gameModel.dificulty ?? "easy")&type=multiple")!)
    }
    
    func getCategory(completionHandler: @escaping (CategoryResponse?, Error?) -> Void) {
        urlSession.dataTask(with: URLRequest(url: URL(string: CATEGORY_URL)!), completionHandler: { data, response, error in
            
            if let data = data {
                let model = try? JSONDecoder().decode(CategoryResponse.self, from: data)
                
                if model != nil {
                    completionHandler(model!, nil)
                } else {
                    completionHandler(nil, error)
                }
            } else {
                completionHandler(nil, error)
            }
        }).resume()
    }
    
    func getGame(gameModel: GameModel, completionHandler: @escaping (GameResponse?, Error?) -> Void) {
        urlSession.dataTask(with: createGameURL(gameModel: gameModel), completionHandler: { data, response, error in
            
            if let data = data {
                let model = try? JSONDecoder().decode(GameResponse.self, from: data)
                
                if model != nil {
                    completionHandler(model!, nil)
                } else {
                    completionHandler(nil, error)
                }
            } else {
                completionHandler(nil, error)
            }
        }).resume()
    }
}
