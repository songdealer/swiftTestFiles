//
//  ACollectionViewCell.swift
//  searchbarTest
//
//  Created by MinG._. on 08/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ACollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    let disposeBag: DisposeBag
    let inData: AnyObserver<String>
    required init?(coder aDecoder: NSCoder) {
        disposeBag = DisposeBag()
        
        let data = PublishSubject<String>()
        
        inData = data.asObserver()
        
        super.init(coder: aDecoder)
        
        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] str in
            self?.label.text = str
        })
        .disposed(by: disposeBag)
    }
}
