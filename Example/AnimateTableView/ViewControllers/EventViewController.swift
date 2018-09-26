//
//  ViewController.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    // MARK: - Static Properties
    
    fileprivate static let titleValueCellId = "TitleValueCellId"
    
    // MARK: - Outlet Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventBackgroundImageView: UIImageView!
    
    // MARK: - Properties
    
    var event: Event!
    
    var detailsViewModel: EventDetailsViewModel!
    
    // MARK: Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewModel = EventDetailsViewModel(event: event)
        eventBackgroundImageView.image = detailsViewModel.image
        
        tableView.register(UINib(nibName: "TitleValueTableViewCell", bundle: nil), forCellReuseIdentifier: EventViewController.titleValueCellId)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: EventViewController.titleValueCellId, for: indexPath) as! TitleValueTableViewCell
        let node = detailsViewModel.nodes[indexPath.row]
        cell.update(title: node.title, value: node.value)
        return cell
    }
}

