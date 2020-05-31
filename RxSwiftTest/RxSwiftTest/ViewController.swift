//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/05/27.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var testView: UIView!
    
    let disposeBag = DisposeBag()
    let vm = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshButton.rx.tap
            .bind(to: vm.refresh)
            .disposed(by: disposeBag)
        
        testView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        // Do any additional setup after loading the view.
    }


}

