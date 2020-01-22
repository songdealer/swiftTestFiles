//
//  ViewController.swift
//  snapshotTest
//
//  Created by MinG._. on 04/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.count += 1
            self.label.text = "\(self.count)"
        }
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            let newView = self.view.snapshotView(afterScreenUpdates: true)!
            
            newView.frame = CGRect(x: 0, y: 300, width: 414, height: 500)
            
            self.view.addSubview(newView)
            
            print(newView.subviews)
            
        }
        // Do any additional setup after loading the view.
    }


}

