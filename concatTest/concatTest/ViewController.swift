//
//  ViewController.swift
//  concatTest
//
//  Created by MinG._. on 11/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = Observable.just(["a", "b", "c"])
        let b = Observable.just(["d", "e", "f"])
        
        let c = a.concat(b).reduce([], accumulator: +)
        
        c.subscribe(onNext: { str in
            print(str)
        })
        .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }


}

