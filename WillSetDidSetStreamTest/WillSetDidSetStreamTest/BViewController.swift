//
//  BViewController.swift
//  WillSetDidSetStreamTest
//
//  Created by MinG._. on 2020/02/17.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    var test: String = "" {
        willSet(new) {
            print("willSet: \(new)")
        }
        didSet(old) {
            print("didSet: \(old)")
        }
    }
    
    required init?(coder: NSCoder) {
        print("Before Init")
        super.init(coder: coder)
        print("After Init")
    }
    // init -> set -> load
    
    override func viewDidLoad() {
        print("Before: DidLoad")
        super.viewDidLoad()
        print("After: DidLoad")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
