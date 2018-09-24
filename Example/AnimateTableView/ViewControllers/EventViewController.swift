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
    
    var eventView: EventViewModel!
    
    // MARK: Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var animation = TableViewAnimation()
        animation.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.height)
        
        tableView.animate(animation)
        eventImageView.image = eventView.mainImage
    }

}

extension EventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }
}

