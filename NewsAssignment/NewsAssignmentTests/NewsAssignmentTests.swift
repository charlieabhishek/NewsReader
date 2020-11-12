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
    
}
