//
//  NewsAssignmentTests.swift
//  NewsAssignmentTests
//
//  Created by Abhishek Kumar on 12/11/20.
//

import XCTest
@testable import NewsAssignment

class NewsAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // Asynchronous network integration testing using expectation
    func testNetworkRequestAsync() {
        let networkService = NetworkService()
        
        //Creating expectation
        let promise = expectation(description: "Network service completed async request")
        
        networkService.requestMostPopularViewed(urlStr: urlMostPopularView) { (error, newsModel) in
            XCTAssert(newsModel != nil)
            promise.fulfill()
        }
        
        // Wait for expectation to fulfill
        waitForExpectations(timeout: 4) { (error) in
            if let error = error {
                XCTFail("expecation error = \(error)")
            }
        }
    }
    
    // Network Test using Mocking
    func test_Get_RequestsTheURL() {
        
        let mockSession = MockURLSession()
        let subject: NetworkService = NetworkService(session: mockSession)
        
        let dataTask = MockURLSessionDataTask()
        mockSession.nextDataTask = dataTask
        
        let url = URL(string: urlMostPopularView)!
        
        subject.requestMostPopularViewed(urlStr: urlMostPopularView) { (error, models) in
            print("Error: \(String(describing: error)) & Models: \(String(describing: models))")
        }
        
        XCTAssertEqual(mockSession.lastURL, url)
        XCTAssert(dataTask.resumeWasCalled)
    }
    
}
