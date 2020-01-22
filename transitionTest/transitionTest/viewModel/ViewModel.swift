//
//  ViewModel.swift
//  transitionTest
//
//  Created by MinG._. on 03/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    let baseURL = "https://2jt4kq01ij.execute-api.ap-northeast-2.amazonaws.com/prod/products?page="
    
    let disposeBag: DisposeBag
    
    let inputSignal: AnyObserver<Void>
    
    let outputData: Observable<[ItemType]>
    
    init() {
        disposeBag = DisposeBag()
        let inputSignal$ = PublishSubject<Void>()
        let outputData$ = PublishSubject<[ItemType]>()
        
        inputSignal = inputSignal$.asObserver()
        
        outputData = outputData$
        
        inputSignal$
            .flatMap{self.rxData("\(self.baseURL)1")}
            .map{try JSONDecoder().decode(model.self, from: $0)}
            .map{$0.body}
            .subscribe(onNext: outputData$.onNext)
            .disposed(by: disposeBag)
    }
    
    func rxData(_ url: String) -> Observable<Data> {
        return Observable.create { emitter in
            self.getData(url) { result in
                switch result {
                case .success(let data):
                    emitter.onNext(data)
                    emitter.onCompleted()
                case .failure(let err):
                    emitter.onError(err)
                }
            }
            return Disposables.create()
        }
    }
    
    func getData(_ url: String, completed: @escaping (Result<Data, Error>) -> Void) {
        
        let _URL = URL(string: url)!
        
        URLSession.shared.dataTask(with: _URL) { data, res, err in
            if let error = err {
                completed(.failure(error))
            }
            guard let data = data else {
                let httpResponse = res as! HTTPURLResponse
                completed(.failure(NSError(domain: "responseError", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            completed(.success(data))
        }.resume()
    }
}
