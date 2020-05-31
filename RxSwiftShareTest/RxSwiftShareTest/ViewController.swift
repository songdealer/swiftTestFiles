//
//  ViewController.swift
//  RxSwiftShareTest
//
//  Created by MinG._. on 2020/02/14.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag: DisposeBag
    
    let input: AnyObserver<Int>
    
    let main: Observable<Int>
    let sub: Observable<String>
    let sub2: Observable<String>
    
    required init?(coder: NSCoder) {
        
        disposeBag = DisposeBag()
        
        let publish = PublishSubject<Int>()
        
        input = publish.asObserver()
        
        main = publish
            .do(onNext: { v in  print("main: \(v)") })
            .share() // 하면 main 한번에 sub, sub2 하나씩
                     // 안하면 sub 한번에 main 한번 sub2 한번에 main 한번
        sub = main
            .do(onNext: { v in  print("sub: \(v)") })
            .map{"int: \($0)"}
        
        sub2 = main
            .do(onNext: { v in print("sub2: \(v)") })
            .map{"int: \($0)"}
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*main.subscribe(onNext: { v in
            print("mainSubscribe: \(v)")
        })
            .disposed(by: disposeBag)
        */
 
        sub.subscribe(onNext: { v in
            print("subSubscribe: \(v)")
        })
            .disposed(by: disposeBag)
        
        sub2.subscribe(onNext: { v in
            print("sub2Subscribe: \(v)")
        })
            .disposed(by: disposeBag)
        
        input.onNext(1)
        input.onNext(2)
        input.onNext(3)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCl(_ sender: Any) {
    }

}

