//
//  EventsViewModel.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import Foundation

struct EventViewModel {
    
    var event: Event
    
    init(event: Event) {
        self.event = event
    }
    
    var title: String {
        return event.title
    }
    
    var address: String {
        return event.address
    }
    
}
