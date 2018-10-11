//
//  EventDetailsViewModel.swift
//  AnimateTableView
//
//  Created by Sargis Mkhitaryan on 9/26/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

final class EventDetailsViewModel {

    struct Node {
        var title: String
        var value: String
    }

    // MARK: - Static Computed Variables

    static var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }

    static var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }

    // MARK: - Stored Variables

    var nodes: [Node] = []

    var image: UIImage?

    // MARK: - Initialization

    init(event: Event) {
        let dayString = EventDetailsViewModel.dayFormatter.string(from: event.date)
        let timeString = EventDetailsViewModel.timeFormatter.string(for: event.date)

        let titleNode = Node(title: "Title", value: event.title)
        let locationNode = Node(title: "Location", value: event.address)
        let dayNode = Node(title: "Day", value: dayString)
        nodes = [titleNode, locationNode, dayNode]

        if let timeStr = timeString {
            let timeNode = Node(title: "Time", value: timeStr)
            nodes.append(timeNode)
        }

        image = UIImage(named: event.image.main)
    }

}
