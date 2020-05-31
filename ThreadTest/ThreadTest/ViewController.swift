//
//  ViewController.swift
//  ThreadTest
//
//  Created by MinG._. on 2020/05/31.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().sync {
            Thread.sleep(until: Date(timeIntervalSinceNow: 2))
            print("1. global sync")
            print(Thread.current)
        }
        
        DispatchQueue.global().sync {
            print("2. global sync")
            print(Thread.current)
        }
        
        DispatchQueue.global().async {
            print("3. global async")
            print(Thread.current)
        }
        
        DispatchQueue.global().async {
            print("4. global async")
            print(Thread.current)
        }
        // Do any additional setup after loading the view.
    }


}

