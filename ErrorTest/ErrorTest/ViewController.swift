//
//  ViewController.swift
//  ErrorTest
//
//  Created by MinG._. on 2020/02/20.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nsErr = NSError(domain: "test", code: -1, userInfo: nil)
        let err = nsErr as Error
        
        let b = err as NSError
        
        print(b)
        // Do any additional setup after loading the view.
    }


}

