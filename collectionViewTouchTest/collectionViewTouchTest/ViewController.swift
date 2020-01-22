//
//  ViewController.swift
//  collectionViewTouchTest
//
//  Created by MinG._. on 21/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["a", "b", "c", "d", "e"]
        items.append(contentsOf: titles)
        
        collectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell.identifier, for: indexPath) as! collectionCell
        
        cell.title.text = items[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! collectionCell
        
        print(cell.title.text)
        
    }
}

 // collectionView touches, collectionCell touches는 반응, didselectItemAt은 무반응

class collectionCell: UICollectionViewCell {
    static let identifier = "Cell"
    @IBOutlet weak var title: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("CollectionCell Touch")
    }
}

extension UICollectionView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("CollectionView Touch")
    }
}
