//
//  MyView.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/06/03.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class MyView: UIView {
    private let xibname = "MyView"
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if !Singleton.instance.flag {
            Singleton.instance.flag = true
            setup()
        }
    }
    
    override func awakeFromNib() {
        if indicator != nil {
            indicator.startAnimating()
        }
    }
    
    deinit {
        indicator.stopAnimating()
    }
    // xib의 클래스에 MyView로 설정을 하면 bundle.loadNibNamed 메소드에서
    // xib를 로드하면서 연결된 클래스(현재 클래스)의 init이 호출되고 거기서 무한 루프의 Bad Access가 되어 버림.
    
    private func setup() {
        
        let bundle = Bundle(for: type(of: self))
        let view = bundle.loadNibNamed(xibname, owner: self, options: nil)
        let v = view?.first as! UIView
        v.frame = self.bounds
        addSubview(v)
    }
}
