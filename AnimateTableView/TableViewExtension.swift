//
//  TableViewExtension.swift
//  AnimateTableView
//
//  Created by Sargis on 9/21/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

struct TableViewAnimation {
    var duration: Double = 0.5
    let delay: TimeInterval = 0.05
}

extension UITableView {
    func animate(_ animation: TableViewAnimation = TableViewAnimation()) {
        reloadData()
        
        for cell in visibleCells {
            cell.transform = CGAffineTransform(translationX: 0.0, y: bounds.height)
        }
        
        for (index, cell) in visibleCells.enumerated() {
            UIView.animate(withDuration: animation.duration,
                           delay: animation.delay * TimeInterval(index),
                           options: [],
                           animations: {
                cell.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            }, completion: nil)
        }
    }
}
