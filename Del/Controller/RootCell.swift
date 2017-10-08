//
//  RootCell.swift
//  Del
//
//  Created by Matt Deuschle on 9/30/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class RootCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!

    func config(bike: Bike) {
        cityLabel.text = bike.name
    }
}
