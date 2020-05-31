//
//  ViewController.swift
//  ContraintTest
//
//  Created by MinG._. on 2020/05/28.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let a = UIView()
        testView.addSubview(a)
        
        a.translatesAutoresizingMaskIntoConstraints = false
        a.backgroundColor = .red
        
        let topAnchor = a.topAnchor.constraint(equalTo: testView.topAnchor)
        let bottomAnchor = a.bottomAnchor.constraint(equalTo: testView.bottomAnchor)
        let leadingAnchor = a.leadingAnchor.constraint(equalTo: testView.leadingAnchor)
        let trailingAnchor = a.trailingAnchor.constraint(equalTo: testView.trailingAnchor)
        
        print("111111111")
        //print(testView.constraints)
        
        testView.addConstraints([topAnchor, bottomAnchor, leadingAnchor, trailingAnchor])
        
        print("222222222")
        //print(testView.constraints)
        
        
        let b = UIView()
        testView.addSubview(b)
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .blue
        
        let topAnchor2 = b.topAnchor.constraint(equalTo: testView.topAnchor)
        let bottomAnchor2 = b.bottomAnchor.constraint(equalTo: testView.bottomAnchor)
        let leadingAnchor2 = b.leadingAnchor.constraint(equalTo: a.trailingAnchor)
        let trailingAnchor2 = b.trailingAnchor.constraint(equalTo: testView.trailingAnchor)
        
        testView.addConstraints([topAnchor2, bottomAnchor2, leadingAnchor2, trailingAnchor2])
        
        //print(testView.subviews.firstIndex(of: a)) -> 0
        //print(testView.subviews.firstIndex(of: b)) - > 1
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            
            a.removeFromSuperview()
            b.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            
            //print(self.testView.constraints)
        })
        
        // Do any additional setup after loading the view.
    }

}

