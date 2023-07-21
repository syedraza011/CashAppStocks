//
//  TimeFixture.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.

import Foundation
import Combine

func formatTimestamp(_ timestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let formattedDate = dateFormatter.string(from: date)
    return formattedDate
}
func formatPriceCents(_ priceCents: Int) -> String {
    let formattedPrice = String(format: "$%.2f", Double(priceCents) / 100)
    return formattedPrice
}
