//
//  EventsViewModel.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

struct EventViewModel {

    // MARK: - Stored Variables

    var event: Event

    // MARK: - Initialization

    init(event: Event) {
        self.event = event
    }

    // MARK: - Computed Variables

    var title: String {
        return event.title
    }

    var address: String {
        return event.address
    }

    var thumbnailImage: UIImage? {
        return UIImage(named: event.image.thumbnail)
    }

    var mainImage: UIImage? {
        return UIImage(named: event.image.main)
    }

}
