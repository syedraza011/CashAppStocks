//
//  CashAppStocksTests.swift
//  CashAppStocksTests
//
//  Created by Syed Raza on 7/10/23.
//



import XCTest
@testable import CashAppStocks
import Combine

// temprary files name which will be passed to the function when called for data
enum FileName: String {
    case realDataFile, missingDataFile, emptyDataFile
}

final class CashAppStocksTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables = []
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
    
    func test_Should_Pass_for_Real_Data() async throws {
        let viewModel = StocksViewModel(service: MockStocksService(fileName: .realDataFile))
        let exp = XCTestExpectation(description: "Expecting to succeed")

        await viewModel.getStocks()

        viewModel.$fullStocks
            .sink { stockResponse in
               XCTAssertTrue(stockResponse.stocks.isEmpty," Stocks should not be empty here")
                exp.fulfill()
            }
            .store(in: &cancellables)
        await fulfillment(of: [exp], timeout: 5.0)
//        wait(for: [exp], timeout: 5.0)
    }


    func test_Should_Fail_for_False_Data() async throws {
        let mockFailureService = MockStocksService(fileName: .missingDataFile)
        let viewModel = StocksViewModel(service: mockFailureService)
        let exp = XCTestExpectation(description: "Expecting to get no data")

        await viewModel.getStocks()

        viewModel.$fullStocks
            .sink { stockResponse in
                XCTAssertTrue(stockResponse.stocks.isEmpty)
                exp.fulfill()
            }
            .store(in: &cancellables)
        await fulfillment(of: [exp], timeout: 5.0)
//        wait(for: [exp], timeout: 5.0)
    }


 
    func test_Should_Pass_for_NO_Data() async throws {
        let mockFailureService = MockStocksService(fileName: .emptyDataFile)
        let viewModel = StocksViewModel(service: mockFailureService)
        let exp = XCTestExpectation(description: "Expecting to get no data")
        
        await viewModel.getStocks()
        
        viewModel.$fullStocks
            .sink { stock in
                print(stock.stocks)
                XCTAssertTrue(stock.stocks.isEmpty)
                exp.fulfill()
            }
            .store(in: &cancellables)
//        wait(for: [exp], timeout: 5.0)
        await fulfillment(of: [exp], timeout: 5.0)
    }
  
}
    

    
    // this class is to called MockService so that filesof data could bea accessed to tests
    class MockStocksService: StocksServiceProtocol {
        
        let fileName: FileName
        
        init(fileName: FileName) {
            self.fileName = fileName
        }
        
        func load(_ file: String) -> URL? {
            return Bundle(for: type(of: self)).url(forResource: file, withExtension: "json")
        }
        
        func fetchStocks() async throws -> StockResponse {
            
           
            guard let url = load(fileName.rawValue) else { throw APIError.invalidUrl}
            
            let data = try! Data(contentsOf: url)
            do {
                let result = try JSONDecoder().decode(StockResponse.self, from: data)
                return result
            } catch {
                throw APIError.emptyData
            }
            
            
        }
    }


