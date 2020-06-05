//
//  ViewController.swift
//  CustomViewTest
//
//  Created by MinG._. on 2020/06/03.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let custom = CustomView()
        custom.frame = view.frame
        
        view.addSubview(custom)
    }


}

