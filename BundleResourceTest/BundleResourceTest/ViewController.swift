//
//  ViewController.swift
//  BundleResourceTest
//
//  Created by MinG._. on 2020/02/21.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = Bundle.main.resourcePath! + "/back.png"
        let b = URL(fileURLWithPath: a)
        
        let c = try? Data(contentsOf: b)
        print(c)
        
        if let url = Bundle.main.url(forResource: "camera", withExtension: "svg", subdirectory: "Assets.xcassets") {
            let data = try? Data(contentsOf: url)
            imageView.image = UIImage(data: data!)
        }
        
        /*if let basePath = Bundle.main.resourcePath {
            let path = basePath + "/" + "camera.svg"
            let a = URL(fileURLWithPath: path)
            let data = try? Data(contentsOf: a)
            imageView.image = UIImage(data: data!)
        }*/
        
        // Do any additional setup after loading the view.
    }


}

