//
//  ViewController.swift
//  RxSwiftScanTest
//
//  Created by MinG._. on 2020/02/13.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let testOb: Observable<Float> = Observable.of(1.0, 1.3, -0.8, 2.2, -2.3)
    let testOb2: Observable<[Float]> = Observable.of([1.0], [1.0, 2.0], [1.0, 2.0, 3.0])

    @IBOutlet weak var collV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        /*testOb.reduce(Float(0), accumulator: {$0 - $1})
            .subscribe(onNext: { value in
                print("reduce: \(value)")
            })
            .disposed(by: disposeBag)

        testOb.scan(Float(0), accumulator: {$0 - $1})
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)*/

        /*testOb.scan((Float(0), Float(0)), accumulator: {($0.1, $1)})
            .subscribe(onNext: { v in
                print(v)
            })
        .disposed(by: disposeBag)*/

        testOb2.scan([Float](), accumulator: { $0 + [$1] })
            .subscribe(onNext: { v in
                print(v)
            })
        .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }

}
