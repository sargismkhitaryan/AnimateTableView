//
//  ProfilesViewController.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    // MARK: - Properties
    
    var eventsViewModels: [EventViewModel] = []
    
    // MARK: - Outlet Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEvents()
    }
    
    // MARK: - Private Methods
    
    private func setupEvents() {
        let event1 = Event(title: "Theater", date: Date(), address: "Yerevan", thumbnailImage: ".png", mainImage: ".png")
        let event2 = Event(title: "Open Handed Revolution", date: Date(), address: "Yerevan", thumbnailImage: ".png", mainImage: ".png")
        let event3 = Event(title: "Cake Party", date: Date(), address: "Dubai", thumbnailImage: ".png", mainImage: ".png")
        let event4 = Event(title: "Celebration Concert", date: Date(), address: "Loc Angeles", thumbnailImage: ".png", mainImage: ".png")
        let event5 = Event(title: "Band Bright", date: Date(), address: "London", thumbnailImage: ".png", mainImage: ".png")
        let events = [event1, event2, event3, event4, event5]
        eventsViewModels = events.map { EventViewModel(event: $0) }
        tableView.animate()
    }

}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        let eventModel = eventsViewModels[indexPath.row]
        cell.textLabel?.text = eventModel.title
        cell.detailTextLabel?.text = eventModel.address
        return cell
    }
    
}
