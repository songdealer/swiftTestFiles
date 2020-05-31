//
//  ViewController.swift
//  RxSwiftBinderTest
//
//  Created by MinG._. on 2020/02/19.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag: DisposeBag
    
    let obv: AnyObserver<Void>
    let obb: Observable<Void>
    
    let b$ = BehaviorSubject<Bool>(value: false)
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var test2Label: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var button: UIButton!
    
    required init?(coder: NSCoder) {
        disposeBag = DisposeBag()
        
        let ob$ = PublishSubject<Void>()
        
        obv = ob$.asObserver()
        obb = ob$
        
        super.init(coder: coder)
        
        obb.bind(to: rx.test())
        .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.rx.tap
            .withLatestFrom(b$)
            .map{!$0}
            .bind(to: b$)
            .disposed(by: disposeBag)
        
        b$.bind(to: rx.animation())
        .disposed(by: disposeBag)
        
        /*let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        
        picker.rx.didFinishPickingMediaWithInfo
            .subscribe(onNext: { data in
                print(data)
            })
        .disposed(by: disposeBag)
        
        present(picker, animated: true)*/
        
        // Do any additional setup after loading the view.
    }

}

extension Reactive where Base: ViewController {
    func test() -> Binder<Void> {
        return Binder(self.base) { target, _ in
            print("test")
        }
    }
    
    func animation() -> Binder<Bool> {
        return Binder(self.base) { target, bool in
            if bool {
                UIView.animate(withDuration: 2.0) {
                    target.topConstraint.constant += 80
                    target.testLabel.superview?.layoutIfNeeded()
                }
            }
            else {
                UIView.animate(withDuration: 2.0) {
                    target.topConstraint.constant = 0
                    target.testLabel.superview?.layoutIfNeeded()
                }
            }
        }
    }
}

extension Reactive where Base: UIImagePickerController {
    public var didFinishPickingMediaWithInfo: Observable<[UIImagePickerController.InfoKey : AnyObject]> {
        return delegate
            .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerController(_:didFinishPickingMediaWithInfo:)))
            .map({ (a) in
                return try castOrThrow(Dictionary<UIImagePickerController.InfoKey, AnyObject>.self, a[1])
            })
    }
}

private func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }

    return returnValue
}
