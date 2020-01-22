//
//  ViewController.swift
//  translateTest
//
//  Created by MinG._. on 18/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        animation()
    }
    func animation() {
        /*print("\(button.frame.origin)") // 20, 896
         button.transform = CGAffineTransform(translationX: 0, y: -100)
         print("\(button.frame.origin)") // 20, 796*/
        
        self.view.clipsToBounds = true
        let tempV = UIView(frame: view.frame)
        tempV.backgroundColor = .black
        view.addSubview(tempV)
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -500
        //view.layer.transform = transform
        view.layer.sublayerTransform = transform
        
        UIView.animate(withDuration: 1.0, animations: {
            let temp = CATransform3DMakeRotation(.pi / 5, 1.0, 0.0, 0.0)
            tempV.layer.transform = CATransform3DTranslate(temp, 1.0, 0.0, 0.0)
            
        }) { (completed) in
            //tempV.removeFromSuperview()
        }
    }
    
}
