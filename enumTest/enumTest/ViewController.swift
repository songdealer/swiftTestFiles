//
//  ViewController.swift
//  enumTest
//
//  Created by MinG._. on 08/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

enum test {
    case a
    case b
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(test.a.hashValue)
        // Do any additional setup after loading the view.
    }


}

