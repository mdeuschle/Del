//
//  Services.swift
//  Del
//
//  Created by Matt Deuschle on 9/30/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

typealias handler = (Bool, [Bike]) -> Void

class DataService {

    static let instance = DataService()

    func getBikeData(handler: @escaping handler) {
        guard let url = URL(string: "https://bikeshare.metro.net/stations/json/") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                do {
                    if let objectDic = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        var bikes = [Bike]()
                        if let objects = objectDic["features"] as? [[String: Any]] {
                            for object in objects {
                                if let objDic = object["properties"] as? [String: Any] {
                                    let bike = Bike(bikeDic: objDic)
                                    bikes.append(bike)
                                }
                            }
                        }
                        handler(true, bikes)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}









