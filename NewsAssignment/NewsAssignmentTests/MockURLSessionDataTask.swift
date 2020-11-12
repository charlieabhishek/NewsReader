//
//  MockURLSessionDataTask.swift
//  NewsAssignmentTests
//
//  Created by Abhishek Kumar on 13/11/20.
//

import Foundation

@testable import NewsAssignment


class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
