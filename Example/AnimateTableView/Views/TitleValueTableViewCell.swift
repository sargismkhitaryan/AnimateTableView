//
//  TitleValueTableViewCell.swift
//  AnimateTableView
//
//  Created by Sargis Mkhitaryan on 9/26/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class TitleValueTableViewCell: UITableViewCell {

    // MARK: - Outlet Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Public Methods
    
    func update(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
    
}
