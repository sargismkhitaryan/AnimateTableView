//
//  ViewController.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    // MARK: - Outlet Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var eventImageView: UIImageView!
    
    // MARK: - Properties
    
    var event: Event!
    
    var detailsViewModel: EventDetailsViewModel!
    
    // MARK: Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewModel = EventDetailsViewModel(event: event)
        
        var animation = TableViewAnimation()
        animation.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.height)
        
        tableView.animate(animation)
        eventImageView.image = detailsViewModel.image
    }

}

extension EventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsViewModel.nodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let node = detailsViewModel.nodes[indexPath.row]
        cell.textLabel?.text = node.value
        return cell
    }
}

