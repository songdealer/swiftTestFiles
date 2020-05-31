//
//  ViewController.swift
//  RxSwiftViewWillAppearTest
//
//  Created by MinG._. on 2020/02/20.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appear = rx.viewWillAppear.share()
        
        appear
            .subscribe(onNext: {
                print("test1")
            })
        .disposed(by: disposeBag)
        
        appear
            .subscribe(onNext: {
                print("test2")
            })
        .disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
    }


}

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { _ in () }
        print("In rx.viewWillAppear")
      return ControlEvent(events: source)
    }
}
