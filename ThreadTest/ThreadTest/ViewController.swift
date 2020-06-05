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
        let a = DispatchQueue(label: "test")
        
        a.asyncAfter(deadline: DispatchTime.now() + 2) {
            //Thread.sleep(until: Date(timeIntervalSinceNow: 2))
            print("1. serial async")
        }
        
        a.sync {
            print("2. serial sync")
        }
        a.async {
            print("3. serial async")
        }
        
        DispatchQueue.global(qos: .utility).sync {
            //Thread.sleep(until: Date(timeIntervalSinceNow: 2))
            print("1. global sync")
            print(Thread.current)
        }
        
        DispatchQueue.global(qos: .default).sync {
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

