//
//  ViewController.swift
//  PreviousObservableTest
//
//  Created by MinG._. on 2020/02/09.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AVFoundation

class ViewController: UIViewController {

    let disposeBag: DisposeBag
    
    let dataOb: AnyObserver<Any>
    
    let previousOb: Observable<(Any?, Any?)>
    let data: Observable<Any>
    
    var player: AVPlayer?
    
    required init?(coder: NSCoder) {
        disposeBag = DisposeBag()
        
        let previousOb$ = BehaviorSubject<(Any?, Any?)>(value: (nil, nil))
        let data$ = PublishSubject<Any>()
        
        dataOb = data$.asObserver()
        
        data = data$
        previousOb = previousOb$
        
        super.init(coder: coder)
        
        data.withLatestFrom(previousOb$) { ($1.1, $0) }
            .do(onNext: { data in
                guard let data = data.0 else { return }
                self.player?.removeTimeObserver(data)
                print("removed")
            })
            .bind(to: previousOb$)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-flo/music.mp3")!
        
        let item = AVPlayerItem(url: url)
        
        player = AVPlayer(playerItem: item)
        
        let t = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 2, preferredTimescale: 1000), queue: .main, using: { time in
            print("t \(time) ? ")
        })
        let t1 = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 3, preferredTimescale: 1000), queue: .main, using: { time in
            print("t1 \(time) ? ")
        })
        let t2 = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 4, preferredTimescale: 1000), queue: .main, using: { time in
            print("t2 \(time) ? ")
        })
        let t3 = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 5, preferredTimescale: 1000), queue: .main, using: { time in
            print("t3 \(time) ? ")
        })
        
        dataOb.onNext(t as Any)
        dataOb.onNext(t1 as Any)
        dataOb.onNext(t2 as Any)
        dataOb.onNext(t3 as Any)
        
        player?.play()
        
        // Do any additional setup after loading the view.
        
    }

}
