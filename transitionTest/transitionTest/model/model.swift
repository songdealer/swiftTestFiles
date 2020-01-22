//
//  model.swift
//  transitionTest
//
//  Created by MinG._. on 03/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation

struct model: Decodable {
    let statusCode: Int
    let body: [ItemType]
}

struct ItemType: Decodable {
    let id: Int
    let thumbnail_520: String
    let title: String
    let seller: String
}

