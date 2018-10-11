//
//  EventTableViewCell.swift
//  AnimateTableView
//
//  Created by Sargis on 9/23/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    // MARK: - Outlet Properties

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!

    // MARK: - Computed variables

    var eventViewModel: EventViewModel! {
        didSet {
            eventImageView.image = eventViewModel.thumbnailImage
            eventTitleLabel.text = eventViewModel.title
            eventDetailLabel.text = eventViewModel.address
        }
    }

}
