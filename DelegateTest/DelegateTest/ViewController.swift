//
//  ViewController.swift
//  DelegateTest
//
//  Created by MinG._. on 2020/02/07.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

protocol VCDelegate {
    func A(data: Data)
    func B(data: Data)
}

class testD: UIView {
    var delegate: VCDelegate?
    
    func tapped() {
        delegate?.A(data: Data())
    }
    
    func clicked() {
        delegate?.B(data: Data())
    }
}

class ViewController: UIViewController, VCDelegate {
    
    let test: testD
    
    required init?(coder: NSCoder) {
        test = testD()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.delegate = self
        // Do any additional setup after loading the view.
    }

    func A(data: Data) {
        //~~
    }
    
    func B(data: Data) {
        //~~
    }
    
}

