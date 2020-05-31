//
//  TestViewController.swift
//  RxSwiftTest
//
//  Created by MinG._. on 2020/05/29.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TestViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    let allData = PublishSubject<[String]>()
    
    override func viewDidAppear(_ animated: Bool) {
        allData
            .bind(to: tableView.rx.items(cellIdentifier: TestCell.identifier, cellType: TestCell.self)) { index, item, cell in
                
                //cell.label.text = item
        }
        .disposed(by: disposeBag)
        
        allData.onNext(["test", "test1"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(TestCell.self, forCellReuseIdentifier: TestCell.identifier)
        
        
        let headquarters = Address(fullAddress: "test1", city: "test")
        let brian = Person(name: "Brian", address: headquarters)
        let ray = Person(name: "Ray", address: headquarters)
        
        print(brian.address.fullAddress)
        
        brian.address.fullAddress = "test2"
        
        print(brian.address.fullAddress)
        print(ray.address.fullAddress)
        
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


class Address {
    var fullAddress: String
    var city: String
    
    init(fullAddress: String, city: String) {
        self.fullAddress = fullAddress
        self.city = city
    }
}

class Person {
    var name: String
    var address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}
