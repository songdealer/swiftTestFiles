//
//  ViewModel.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/05/27.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
    
    let refresh: AnyObserver<Void>
    
    let allData: Observable<String>
    
    init() {
        let refresh$ = PublishSubject<Void>()
        let allData$ = PublishSubject<String>()
        
        refresh = refresh$.asObserver()
        allData = allData$
        
        refresh$
            .do(onNext: { _ in print("test") })
            .map{ "test" }
            .bind(to: allData$)
            
        .disposed(by: disposeBag)
    }
}
