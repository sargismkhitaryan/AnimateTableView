//
//  ProfilesViewController.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    typealias EventCellType = EventTableViewCell

    fileprivate static let eventCellId = "EventCell"

    // MARK: - Properties

    var eventsViewModels: [EventViewModel] = []

    // MARK: - Outlet Properties

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "EventTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: EventsViewController.eventCellId)

        setupEvents()

        var animation = TableViewAnimation()
        animation.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)

        tableView.animate(animation)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventSegue" {
            guard let destinationVC = segue.destination as? EventViewController else {
                fatalError("The type of destination controller should be EventViewController")
            }
            guard let event = sender as? Event else {
                fatalError("The type of sender must be Event")
            }
            destinationVC.event = event
        }
    }

    // MARK: - Private Methods

    private func setupEvents() {
        let event1 = Event(title: "Theater",
                           date: Date(),
                           address: "Yerevan",
                           thumbnailImage: "audience-crowd-event-thumbnail.png",
                           mainImage: "audience-crowd-event.png")
        let event2 = Event(title: "Open Handed Revolution",
                           date: Date(),
                           address: "Yerevan",
                           thumbnailImage: "audience-blur-bokeh-thumbnail.png",
                           mainImage: "audience-blur-bokeh.png")
        let event3 = Event(title: "Cake Party",
                           date: Date(),
                           address: "Dubai",
                           thumbnailImage: "architecture-auditorium-blue-thumbnail.png",
                           mainImage: "architecture-auditorium-blue.png")
        let event4 = Event(title: "Celebration Concert",
                           date: Date(),
                           address: "Loc Angeles",
                           thumbnailImage: "audience-celebration-concert-thumbnail.png",
                           mainImage: "audience-celebration-concert.png")
        let event6 = Event(title: "Beach Celebration",
                           date: Date(),
                           address: "Jimbaran, Bali",
                           thumbnailImage: "aisle-beach-celebration-thumbnail.png",
                           mainImage: "aisle-beach-celebration.png")
        let event7 = Event(title: "Football Match",
                           date: Date(),
                           address: "Barcelona, Spain",
                           thumbnailImage: "athletes-audience-ball-thumbnail.png",
                           mainImage: "athletes-audience-ball.png")
        let events = [event1, event2, event3, event4, event6, event7]
        eventsViewModels = events.map { EventViewModel(event: $0) }
    }

}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = EventsViewController.eventCellId
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? EventCellType else {
            fatalError("The type of cell is false.")
        }
        let eventModel = eventsViewModels[indexPath.row]
        cell.eventViewModel = eventModel
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = eventsViewModels[indexPath.row]
        performSegue(withIdentifier: "EventSegue", sender: viewModel.event)
    }

}
