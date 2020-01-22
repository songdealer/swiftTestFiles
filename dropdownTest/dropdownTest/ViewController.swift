//
//  ViewController.swift
//  dropdownTest
//
//  Created by MinG._. on 09/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var txt: UITextField!
    
    let disposeBag: DisposeBag
    let displayOn: AnyObserver<Bool>
    let display: Observable<Bool>
    let buttonBox = Observable.just(["모든 피부 타입", "oily", "dry", "sensitive"])
    
    required init?(coder aDecoder: NSCoder) {
        disposeBag = DisposeBag()
        
        let displayOn$ = BehaviorSubject<Bool>(value: true)
        displayOn = displayOn$.asObserver()
        display = displayOn$
        
        super.init(coder: aDecoder)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.frame.origin.y += 80
        view.layer.cornerRadius = 40
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*tableView.translatesAutoresizingMaskIntoConstraints = true
        hiddenView.frame.size.height = 0
        button2.rx.tap.withLatestFrom(display)
            .map{!$0}
            .bind(to: displayOn)
            .disposed(by: disposeBag)
        
        
        buttonBox.bind(to: tableView.rx.items(cellIdentifier: dropdownTableViewCell.identifier, cellType: dropdownTableViewCell.self)) { idx, item, cell in
            cell.onData.onNext(item)
            }
            .disposed(by: disposeBag)
        
        display.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] bool in
                if bool {
                    UIView.animate(withDuration: 0.3) {
                        self?.tableView.frame.size.height = 0
                    }
                }
                else {
                    UIView.animate(withDuration: 0.3) {
                        self?.tableView.frame.size.height = (self?.tableView.contentSize.height)!
                    }
                }
            })
            .disposed(by: disposeBag)
        
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] idx in
                self?.tableView.deselectRow(at: idx, animated: true)
            })
            .disposed(by: disposeBag)
        */
        
        view.layer.cornerRadius = 40
        view.layoutIfNeeded()
        
        let types = ["oily", "dry", "sensitive"]
        
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let typeSelected: (UIAlertAction) -> Void = { action in
            self.button1.setTitle(action.title, for: .normal)
        }
        for type in types {
            let action = UIAlertAction(title: type, style: .default, handler: typeSelected)
            
            alertVC.addAction(action)
        }
        button1.rx.tap
            .subscribe(onNext: {
                 self.present(alertVC, animated: true)
            })
        .disposed(by: disposeBag)
        
        // Do any additional setup after loading the view.
    }
}
