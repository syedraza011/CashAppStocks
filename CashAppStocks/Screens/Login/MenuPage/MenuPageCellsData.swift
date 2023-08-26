//
//  MenuPageCellsData.swift
//  FacebookUI
//
//  Created by Joshua Ho on 6/29/23.
//

import Foundation

struct MenuCell: Identifiable {
    var id = UUID()
    
    let image: String
    let title: String
//    let destination: String //not implemented for now until other pages created
    
    static let shortcutsData = [
        MenuCell(image: "bookmark.fill", title: "Saved"),
        MenuCell(image: "flag.fill", title: "Pages"),
        MenuCell(image: "video.bubble.left", title: "Reels"),
        MenuCell(image: "newspaper", title: "News"),
        MenuCell(image: "handbag.fill", title: "Shop"),
        MenuCell(image: "person.2.circle.fill", title: "Groups"),
        MenuCell(image: "face.smiling.inverse", title: "Avatars"),
        MenuCell(image: "exclamationmark.bubble.circle.fill", title: "Crisis response"),
 
    ]
    
    static let helpAndSupportData = [
        MenuCell(image: "lifepreserver", title: "Help Center"),
        MenuCell(image: "tray.fill", title: "Support Inbox"),
        MenuCell(image: "exclamationmark.triangle.fill", title: "Report a problem"),
        MenuCell(image: "lock.shield.fill", title: "Safety"),
        MenuCell(image: "book.closed.fill", title: "Terms & Policies")
    ]
    
    static let settingsAndPrivacyData = [
        MenuCell(image: "person.circle.fill", title: "Settings"),
        MenuCell(image: "iphone", title: "Device requests"),
        MenuCell(image: "rectangle.3.group.bubble.left.fill", title: "Recent ad activity"),
        MenuCell(image: "creditcard.fill", title: "Orders and payments")
    ]
}
