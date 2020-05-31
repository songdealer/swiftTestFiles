//
//  ViewController.swift
//  TextViewHeightTest
//
//  Created by MinG._. on 2020/02/20.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textView.sizeToFit()
        heightConstraint.constant = textView.frame.height
        contentViewHeightConstraint.constant = textView.frame.origin.y + textView.frame.height + 12
    }
}
