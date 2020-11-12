//
//  MockURLSession.swift
//  NewsAssignmentTests
//
//  Created by Abhishek Kumar on 13/11/20.
//

import Foundation
@testable import NewsAssignment

class MockURLSession: URLSessionProtocol {
    
    private (set) var lastURL: URL?
    var nextDataTask = MockURLSessionDataTask()
    
    func dataTask(with url: URL, completion: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        return nextDataTask
    }
    
}
