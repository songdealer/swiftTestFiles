//
//  ViewController.swift
//  WillSetDidSetStreamTest
//
//  Created by MinG._. on 2020/02/17.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "test" {
            let toVC = segue.destination as! BViewController
            toVC.test = "test"
        }
    }
}

