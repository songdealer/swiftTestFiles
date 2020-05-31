//
//  ViewController.swift
//  CMTimeTest
//
//  Created by MinG._. on 2020/02/07.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    var player: AVPlayer?
    var ob: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let time1 = CMTime(seconds: 10.0, preferredTimescale: 1000)
        let time2 = CMTime(seconds: 9.0, preferredTimescale: 100) // time1 == time2
        
        let path = Bundle.main.path(forResource: "BeautifulLove", ofType: "mp3")
        let item = AVPlayerItem(url: URL(fileURLWithPath: path!))
        player = AVPlayer(playerItem: item)
        
        ob = player?.addBoundaryTimeObserver(forTimes: [NSValue(time: time1), NSValue(time: time2)], queue: .global()) {
            self.test()
        }
        
        btn.tag = 0
        
        // Do any additional setup after loading the view.
    }

    func test() {
        let time1 = CMTime(seconds: 10.0, preferredTimescale: 1000)
        print(time1)
        print(player!.currentTime())
        print(time1 < player!.currentTime()) // time1 value = 10000 scale = 1000 10.0
                                             // current value = 1001449391 scale = 1000000000 10.01~~
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        if btn.tag == 0 {
            player?.play()
            btn.tag = 1
        }
        else {
            player?.pause()
            btn.tag = 0
        }
    }
    
    @IBAction func btn2Clicked(_ sender: Any) {
        player?.seek(to: CMTime(seconds: 0, preferredTimescale: 1000))
    }
    
}

