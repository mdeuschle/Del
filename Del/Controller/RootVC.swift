//
//  RootVC.swift
//  Del
//
//  Created by Matt Deuschle on 9/30/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import UIKit

class RootVC: UIViewController {

    @IBOutlet weak var rootTableView: UITableView!
    var bikes = [Bike]()
    var selectedBike: Bike?

    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.instance.getBikeData { (success, bikes) in
            if success {
                DispatchQueue.main.async {
                    for bike in bikes {
                        self.bikes.append(bike)
                        self.rootTableView.reloadData()
                    }
                }
            }
        }
        rootTableView.delegate = self
        rootTableView.dataSource = self
        let nib = UINib(nibName: "RootCell", bundle: nil)
        rootTableView.register(nib, forCellReuseIdentifier: "RootCell")
    }
}

extension RootVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RootCell", for: indexPath) as? RootCell else {
            return RootCell()
        }
        let bike = bikes[indexPath.row]
        cell.config(bike: bike)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBike = bikes[indexPath.row]
        navigationController?.popViewController(animated: true)
    }

    func getSelectedBike(handler: @escaping (Bool, Bike) -> Void) {
        if let bike = selectedBike {
            handler(true, bike)
        }
    }
}








