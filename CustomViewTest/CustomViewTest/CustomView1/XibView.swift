//
//  XibView.swift
//  CustomViewTest
//
//  Created by MinG._. on 2020/06/03.
//  Copyright © 2020 MinG._. All rights reserved.
//


import UIKit

class XibView: UIView {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        indicator.startAnimating()
    }
}
