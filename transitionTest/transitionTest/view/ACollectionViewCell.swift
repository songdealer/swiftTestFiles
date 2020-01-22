//
//  ACollectionViewCell.swift
//  transitionTest
//
//  Created by MinG._. on 03/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift

class ACollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CollectionCell"
    var disposeBag: DisposeBag
    let onData: AnyObserver<ItemType>
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    required init?(coder aDecoder: NSCoder) {
        
        disposeBag = DisposeBag()
        let data = PublishSubject<ItemType>()
        
        onData = data.asObserver()
        super.init(coder: aDecoder)
        data.observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .do (onNext: { [weak self] item in
                DispatchQueue.main.async {
                    self?.label.text = "\(item.title)"
                }
            })
            .map{try Data(contentsOf: URL(string: $0.thumbnail_520)!)}
            .subscribe(onNext: { [weak self] image in
                DispatchQueue.main.async {
                    guard let image = UIImage(data: image) else {
                        self?.imageView.image = nil
                        return
                    }
                    self?.imageView.image = image
                }
                }, onDisposed: {print("disposed")})
            .disposed(by: disposeBag)
    }
}
