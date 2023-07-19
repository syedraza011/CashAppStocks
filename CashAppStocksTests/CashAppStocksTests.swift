//
//  CashAppStocksTests.swift
//  CashAppStocksTests
//
//  Created by Syed Raza on 7/10/23.
//

import XCTest
@testable import CashAppStocks

final class CashAppStocksTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getPostsAsyncAwait_should_succeed() async throws {
        let viewModel = StockViewModel(service: MockPostsService(fileName: .stockSuccess))
        
        // Expectation: The sectionPosts should be populated correctly
        // Set up any necessary mock objects or data
        let expectation = XCTestExpectation(description: "Posts fetched successfully")
        
        // Call the function being tested
        await viewModel.getPostsAsyncAwait()
        
        // Assert the expected results
        viewModel.$sectionPosts
            .dropFirst() // Skip initial value
            .sink { sectionPosts in
                // Perform your assertions on the sectionPosts here
                XCTAssertFalse(sectionPosts.isEmpty, "sectionPosts should not be empty")
                let firstSection = sectionPosts.first!
                XCTAssertEqual(firstSection.posts.first!.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
                // Fulfill the expectation
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Wait for the expectation to be fuzMoclfilled
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
class MockStockService: StockServiceProtocol {
    let fileName: FileName
    init(fileName: FileName) {
        self.fileName = fileName
    }
    private fetchStocksusingAsyncAwait () async throws - > []
}
