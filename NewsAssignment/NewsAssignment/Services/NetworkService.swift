//
//  NetworkService.swift
//  NewsAssignment
//
//  Created by Abhishek Kumar on 12/11/20.
//

import Foundation


enum NetworkServiceError: Error {
    case invalid(String)
    case parsingError(String)
}

class NetworkService {
    
    func requestMostPopularViewed(urlStr: String, completionHandler: @escaping (Error?, [NewsModel]?)->Void) {
        
        guard let url = URL(string: urlStr) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse, httpResponse.isResponseOK() else {
                completionHandler(NetworkServiceError.invalid("Invalid status code"), nil)
                return
            }
            
            guard let data = data else {
                completionHandler(NetworkServiceError.invalid("Data is invalid"), nil)
                return
            }
            
            do {
                let newsModel = try JSONDecoder().decode(MostPopularNewsModel.self, from: data)
                completionHandler(nil, newsModel.results)
            } catch {
                print("Error -> \(error.localizedDescription)")
                completionHandler(NetworkServiceError.parsingError("Error in parsing."), nil)
            }
        }.resume()
        
    }
}


extension HTTPURLResponse {
    func isResponseOK() -> Bool {
        return (200...299).contains(self.statusCode)
    }
}
