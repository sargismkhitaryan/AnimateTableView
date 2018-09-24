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
    var delay: TimeInterval = 0.05
    var transform: CGAffineTransform?
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

extension UITableView {
    func animate(_ animation: TableViewAnimation = TableViewAnimation()) {
        reloadData()

        guard let trans = animation.transform else {
            return
        }
        
        for cell in visibleCells {
            cell.transform = trans
        }
        
        for (index, cell) in visibleCells.enumerated() {
            UIView.animate(withDuration: animation.duration,
                           delay: animation.delay * TimeInterval(index),
                           options: [],
                           animations: {
                cell.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                cell.transform = CGAffineTransform(rotationAngle: 0)
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}
