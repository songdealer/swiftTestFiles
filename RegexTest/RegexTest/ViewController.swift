//
//  ViewController.swift
//  RegexTest
//
//  Created by MinG._. on 2020/02/06.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let str = "[00:33:600]and a happy new year"
        let str2 = "[00:28:700]we wish you a merry christmas"
        let regex = "\\[\\d+:\\d+:\\d+\\]"
        
        let pattern = try? NSRegularExpression(pattern: regex, options: .caseInsensitive)
        
        //let temp = pattern?.matches(in: str, options: .anchored, range: NSRange(str)!)
        let ran = NSRange(location: 0, length: str.count)
        let temp = pattern?.matches(in: str, options: .anchored, range: ran)
        
        let range = Range(temp![0].range, in: str)!
        
        let subs = String(str[range])
        
        print(subs.components(separatedBy: ["[", ":", "]"]).filter{!$0.isEmpty})
        //str[range.upperBound...str.index(str.endIndex, offsetBy: -1)]
        
    }


}

