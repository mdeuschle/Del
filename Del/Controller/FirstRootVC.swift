//
//  FirstRootVC.swift
//  Del
//
//  Created by Matt Deuschle on 9/30/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class FirstRootVC: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    let rootVC = RootVC()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootVC.getSelectedBike { (success, bike) in
            if success {
                self.nameLabel.text = bike.name
            }
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(rootVC, animated: true)
    }
}
