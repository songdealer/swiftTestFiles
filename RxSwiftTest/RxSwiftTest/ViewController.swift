//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/05/27.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testView2: UIView!
    
    let disposeBag = DisposeBag()
    let vm = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*refreshButton.rx.tap
            .bind(to: vm.refresh)
            .disposed(by: disposeBag)
        
        testView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        */
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(test))
        gesture.delegate = self
        
        print(gesture.minimumNumberOfTouches)
        gesture.maximumNumberOfTouches = 1
        
        //print(UIGestureRecognizer.State.began.rawValue) 1
        //print(UIGestureRecognizer.State.cancelled.rawValue) 4
        //print(UIGestureRecognizer.State.changed.rawValue) 2
        //print(UIGestureRecognizer.State.ended.rawValue) 3
        //print(UIGestureRecognizer.State.failed.rawValue) 5
        //print(UIGestureRecognizer.State.possible.rawValue) 0
        testView2.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
    }


    @objc func test(gesture: UIPanGestureRecognizer) {
        
        let transition = gesture.translation(in: testView2)
        //let changedX = testView2.center.x + transition.x
        let changedY = testView2.center.y + transition.y
        testView2.center = CGPoint(x: testView2.center.x, y: changedY)
        
        gesture.setTranslation(CGPoint.zero, in: testView2)
    }
    
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
}
