//
//  StcokService.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//
import Foundation
import Combine

enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case emptyData
    case serviceUnavailable
    case decodingError
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "invalid url"
        case .invalidResponse:
            return "invalid response"
        case .emptyData:
            return "empty data"
        case .serviceUnavailable:
            return "service unavailable"
        case .decodingError:
            return "decoding error"
        }
    }
}



protocol StocksServiceProtocol {
    func fetchStocks() async throws -> StockResponse
}


class StocksService: StocksServiceProtocol {
    struct Constants {
        static let baseURL = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    }

    func fetchStocks() async throws ->  StockResponse{
        guard let url = URL(string: Constants.baseURL) else {
            throw APIError.invalidUrl
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }

            let result = try JSONDecoder().decode(StockResponse.self, from: data)
            return result
        } catch {
            throw APIError.decodingError
        }

    } // ending fetchStocks
} //ending stock service
