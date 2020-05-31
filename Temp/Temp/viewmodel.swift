//
//  viewmodel.swift
//  Temp
//
//  Created by MinG._. on 2020/02/24.
//  Copyright © 2020 MinG._. All rights reserved.
//

import RxSwift

class viewmodel {
    let disposeBag: DisposeBag
    
    let modeInput: AnyObserver<String>
    
    let mode: Observable<String>
    
    init() {
        disposeBag = DisposeBag()
        
        let stream = BehaviorSubject<String>(value: "test")
        
        modeInput = stream.asObserver()
        
        mode = stream
    }
}
