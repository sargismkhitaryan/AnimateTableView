//
//  ViewController.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
    }
    
    // MARK: Private Methods
    
    private func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        
        let tableHeight = tableView.bounds.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0.0, y: tableHeight)
        }
        
        for (index, cell) in cells.enumerated() {
            UIView.animate(withDuration: 0.5, delay: 0.05 * TimeInterval(index), options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            }, completion: nil)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }
}

