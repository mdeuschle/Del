//
//  Bike.swift
//  Del
//
//  Created by Matt Deuschle on 9/30/17.
//  Copyright © 2017 Matt Deuschle. All rights reserved.
//

import Foundation

struct Bike {

    private(set) public var name: String!

    init(bikeDic: [String: Any]) {
        if let name = bikeDic["name"] as? String {
            self.name = name
        } else {
            self.name = ""
        }
    }
}












