//
//  NetworkProtocols.swift
//  NewsAssignment
//
//  Created by Abhishek Kumar on 13/11/20.
//

import Foundation

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with url: URL, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with url: URL, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        dataTask(with: url, completionHandler: completion) as URLSessionDataTaskProtocol
    }
}


protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
