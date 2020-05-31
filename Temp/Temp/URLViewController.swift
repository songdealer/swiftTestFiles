//
//  URLViewController.swift
//  Temp
//
//  Created by MinG._. on 2020/02/23.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class URLViewController: UIViewController {

    let disposeBag: DisposeBag
    let viewModel: viewmodel
    
    @IBOutlet weak var label: UILabel!
    
    required init?(coder: NSCoder) {
        disposeBag = DisposeBag()
        viewModel = viewmodel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.mode
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
