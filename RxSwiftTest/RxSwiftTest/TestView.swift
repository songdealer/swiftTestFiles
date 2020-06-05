//
//  TestView.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/06/03.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

@IBDesignable
class TestView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let indicator = UIActivityIndicatorView(frame: frame)
        indicator.style = .whiteLarge
        indicator.color = .white
        backgroundColor = .black
        alpha = 0.3
        addSubview(indicator)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
