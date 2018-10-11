//
//  Event.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import Foundation

class Event {

    // MARK: - Properties

    var title: String
    var eventDescription: String?
    var date: Date
    var address: String
    var image: (thumbnail: String, main: String)

    // MARK: - Initialization

    init(title: String, date: Date, address: String, thumbnailImage: String, mainImage: String) {
        self.title = title
        self.date = date
        self.address = address
        self.image = (thumbnailImage, mainImage)
    }
}

extension Event: CustomStringConvertible {
    var description: String {
        return "title: \(title) address: \(address)"
    }
}
