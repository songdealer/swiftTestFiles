//
//  dropdownTableViewCell.swift
//  dropdownTest
//
//  Created by MinG._. on 09/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class dropdownTableViewCell: UITableViewCell {
    static let identifier = "dropCell"
    @IBOutlet weak var label: UILabel!
    
    let disposeBag: DisposeBag
    let onData: AnyObserver<String>
    
    required init?(coder aDecoder: NSCoder) {
        disposeBag = DisposeBag()
        let data$ = PublishSubject<String>()
        onData = data$.asObserver()
        
        super.init(coder: aDecoder)
        
        data$
            .subscribe(onNext: { [weak self] str in
                self?.label.text = str
            })
            .disposed(by: disposeBag)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
