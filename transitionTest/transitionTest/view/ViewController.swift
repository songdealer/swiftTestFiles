//
//  ViewController.swift
//  transitionTest
//
//  Created by MinG._. on 02/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

// vc setting -> viewDidLoad -> delegate -> presented -> animation
//               func present = viewDidLoad, delegate / ~ animation

class ViewController: UIViewController {
    @IBOutlet weak var collectionV: UICollectionView!
    
    let disposeBag: DisposeBag = DisposeBag()
    let viewModel: ViewModel
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        // Do any additional setup after loading the view.
    }
    required init?(coder aDecoder: NSCoder) {
        viewModel = ViewModel()
        super.init(coder: aDecoder)
    }
    
    func binding() {
        viewModel.inputSignal.onNext(())
        
        viewModel.outputData
            .bind(to: collectionV.rx.items(cellIdentifier: ACollectionViewCell.identifier, cellType: ACollectionViewCell.self)) { index, item, cell in
                cell.onData.onNext(item)
        }
        .disposed(by: disposeBag)
        
        
        collectionV.rx.itemSelected
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] index in
                let cell = self?.collectionV.cellForItem(at: index) as! ACollectionViewCell
                self?.performSegue(withIdentifier: "test", sender: index)
            })
            .disposed(by: disposeBag)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BViewController
        index = sender as! IndexPath
        vc.transitioningDelegate = self
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("presented: \(presented)")
        print("presenting: \(presenting)")
        print("source: \(source)")
        return transitions(index!)
    }
}

class transitions: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let indexPath: IndexPath
    
    init(_ indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ViewController, let toVC = transitionContext.viewController(forKey: .to) as? BViewController, let snapshot = toVC.view.snapshotView(afterScreenUpdates: true) else { return }
        
        let cell = fromVC.collectionV.cellForItem(at: indexPath) as! ACollectionViewCell
        
        let newFrame = fromVC.collectionV.convert(cell.frame, to: fromVC.view)
        
        let duration = transitionDuration(using: transitionContext)
        
        let containerView = transitionContext.containerView
        
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .overrideInheritedOptions,
            animations: {
                let image = cell.imageView.image
                let hiddenView = testView(frame: newFrame)
                hiddenView.name = "hidden"
                let imageView = UIImageView(frame: newFrame)
                imageView.image = image
                
                hiddenView.backgroundColor = .white
                containerView.addSubview(hiddenView)
                containerView.addSubview(imageView)
                containerView.addSubview(toVC.view)
                toVC.view.isHidden = true
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    imageView.frame = CGRect(x: 0, y: 0, width: 414, height: 414)
                }
        },
            completion: { bool in
                toVC.view.isHidden = false
                transitionContext.completeTransition(true)
        })
        
    }
}

class testView: UIView {
    var name: String = ""
    
    deinit {
        print("deinit")
    }
}
