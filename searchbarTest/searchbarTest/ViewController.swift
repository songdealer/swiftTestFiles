//
//  ViewController.swift
//  searchbarTest
//
//  Created by MinG._. on 08/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!

    let ab: AnyObserver<[String]>
    let ob: Observable<[String]>
    let allOut: Observable<[String]>
    let allIn: AnyObserver<[String]>
    let disposeBag: DisposeBag
    
    required init?(coder aDecoder: NSCoder) {
        disposeBag = DisposeBag()
        
        let ob$ = PublishSubject<[String]>()
        let all$ = PublishSubject<[String]>()
        
        ab = ob$.asObserver()
        ob = ob$
        allOut = all$
        allIn = all$.asObserver()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataSet = [String]()
        
        for i in 1...30 {
            dataSet.append("\(i)")
        }
        
        searchBar.rx.text.orEmpty.withLatestFrom(allOut) { ($0, $1) }
            .map{ dat -> [String] in
                print(dat.0)
                print(dat.1)
                return dat.1.filter{ $0.hasPrefix(dat.0) }
            }
            .do(onNext: { str in
                print(str)
            })
            .bind(to: collectionView.rx.items(cellIdentifier: "cell", cellType: ACollectionViewCell.self)) { index, item, cell in
                cell.inData.onNext("\(item)")
            }
            .disposed(by: disposeBag)
        
        
        allIn.onNext(dataSet)
        ab.onNext(dataSet)
        
        // Do any additional setup after loading the view.
    }
    
}

