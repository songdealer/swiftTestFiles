//
//  ViewController.swift
//  RxSwiftSentMessageMethodInvokedTest
//
//  Created by MinG._. on 2020/02/19.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindings()
        
        printing()
        // Do any additional setup after loading the view.
    }
    func bindings() {
        rx.sentMessage(#selector(self.printing)).subscribe(onNext: { any in
            print("sentMessage \(any)")
        })
            .disposed(by: disposeBag)
        
        rx.methodInvoked(#selector(self.printing)).subscribe(onNext: { any in
            print("methodInvoked \(any)")
        })
            .disposed(by: disposeBag)
    }
    
    @objc dynamic func printing() {
        print("test")
    }

}

