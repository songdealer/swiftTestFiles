//
//  ViewController.swift
//  avTest
//
//  Created by MinG._. on 22/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import AVFoundation

import RxSwift
import RxCocoa
import RxAVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var playAndPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var lyric1: UILabel!
    @IBOutlet weak var lyric2: UILabel!
    @IBOutlet weak var lyric3: UILabel!
    
    let itemReady: AnyObserver<Items>
    
    var disposeBag: DisposeBag
    var player: AVPlayer?
    var timeObserver: Any?
    var lyricObserver: Any?
    var ob: Observable<Void>?
    
    let playerSetting = PublishSubject<String>()
    let sliderSetting = PublishSubject<Int>()
    
    required init?(coder: NSCoder) {
        disposeBag = DisposeBag()
        
        let item$ = PublishSubject<Items>()
        let image$ = PublishSubject<String>()
        let lyric = PublishSubject<String>()
        
        itemReady = item$.asObserver()
        
        super.init(coder: coder)
        
        item$.subscribe(onNext: { [weak self] item in
            image$.onNext(item.image)
            self?.playerSetting.onNext(item.file)
            self?.sliderSetting.onNext(item.duration)
            lyric.onNext(item.lyrics)
        })
            .disposed(by: disposeBag)
        
        image$.map{URL(string: $0)}
            .filter{$0 != nil}
            .map{try Data(contentsOf: $0!)}
            .map{UIImage(data: $0)}
            .filter{$0 != nil}
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] image in
                self?.imageView.image = image
            })
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let urlString = "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-flo/song.json"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { [weak self] data, res, error in
            guard let data = data else { return }
            
            let item = try? JSONDecoder().decode(Items.self, from: data)
            if let item = item {
                self?.itemReady.onNext(item)
            }
        }.resume()
        
        playAndPauseButton.rx.tap
            .filter{self.player != nil}
            .map{self.player!}
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] player in
                if player.status == .readyToPlay {
                    if self?.playAndPauseButton.tag == 0 {
                        player.play()
                        self?.playAndPauseButton.tag = 1
                        self?.playAndPauseButton.setImage(UIImage(named: "pause.fill"), for: .normal)
                    }
                    else {
                        player.pause()
                        self?.playAndPauseButton.tag = 0
                        self?.playAndPauseButton.setImage(UIImage(named: "play.fill"), for: .normal)
                    }
                }
            })
            .disposed(by: disposeBag)
        
        playerSetting.map{URL(string: $0)}
            .filter{$0 != nil}
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] mp3 in
                self?.player = AVPlayer(url: mp3!)
                
                self?.timeObserver = self?.player?.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 10, timescale: 10), queue: .main) { time in
                    self?.slider.value = Float(CMTimeGetSeconds(time))
                }
                
                self?.lyricObserver = self?.player?.addBoundaryTimeObserver(forTimes: [NSValue(time: CMTimeMake(value: 10, timescale: 10)), NSValue(time: CMTimeMake(value: 50, timescale: 10))], queue: .main) {
                    print("go")
                }
            })
            .disposed(by: disposeBag)
        
        sliderSetting
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
            self?.slider.minimumValue = 0.0
            self?.slider.maximumValue = Float(value)
        })
            .disposed(by: disposeBag)
        
        slider.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.player?.seek(to: CMTimeMake(value: Int64((self?.slider.value)!), timescale: 1))
            })
        .disposed(by: disposeBag)
        
        */
        
        /*let url = URL(string: "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-flo/music.mp3")!
        
        let item = AVPlayerItem(url: url)
        
        player = AVPlayer(playerItem: item)
        
        player?.boundaryTimeObserver(times: [CMTime(seconds: 1.0, preferredTimescale: 100)])
            .subscribe(onNext: { time in
                print("go")
            }).disposed(by: disposeBag)
        
        player?.boundaryTimeObserver(times: [CMTime(seconds: 2.700, preferredTimescale: 100000), CMTime(seconds: 2.701, preferredTimescale: 100000)])
            .subscribe(onNext: { time in
                print(time.seconds)
            })
            .disposed(by: disposeBag)
        
        player?.play()
        */
        
        let a = ["a","b","c"]
        
        let idx = 0
        
        let range = idx...idx + 2
        
        //let a = "test"
        //a.size(withAttributes: [NSAttributedString.Key.font : lyric1.font])
        
        // Do any additional setup after loading the view.
    }
}


extension AVPlayer {
    
    func boundaryTimeObserver(times: [CMTime]) -> Observable<CMTime> {
        return Observable.create { observer in
            let timeValues = times.map() { NSValue(time: $0) }
            let t = self.addBoundaryTimeObserver(forTimes: timeValues, queue: nil) {
                observer.onNext(self.currentTime())
            }
            print("init!")
            
            return Disposables.create { print("Disposed!");self.removeTimeObserver(t) }
        }
    }
}

struct Items: Decodable {
    let singer: String
    let album: String
    let title: String
    let duration: Int
    let image: String
    let file: String
    let lyrics: String
}
