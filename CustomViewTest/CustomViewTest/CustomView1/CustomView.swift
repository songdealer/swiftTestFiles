//
//  CustomView.swift
//  CustomViewTest
//
//  Created by MinG._. on 2020/06/03.
//  Copyright © 2020 MinG._. All rights reserved.
//


import UIKit

class CustomView: UIView {
    let xibname = "CustomView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let custom = Bundle.main.loadNibNamed(xibname, owner: self, options: nil)?.first as! XibView
        custom.frame = self.bounds
        addSubview(custom)
    }
}
