//
//  Singleton.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/06/03.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation

class Singleton {
    static let instance = Singleton()
    var flag = false
    private init() { }
}
