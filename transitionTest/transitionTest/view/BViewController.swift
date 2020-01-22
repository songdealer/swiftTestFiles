//
//  BViewController.swift
//  transitionTest
//
//  Created by MinG._. on 02/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.view.backgroundColor = .red
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func btn(_ sender: Any) {
        dismiss(animated: false)
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
