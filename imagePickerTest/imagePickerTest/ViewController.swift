//
//  ViewController.swift
//  imagePickerTest
//
//  Created by MinG._. on 31/10/2019.
//  Copyright © 2019 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func test() {
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            dismiss(animated: true, completion: nil)
            let iv = UIImageView(frame: self.view.frame)
            iv.image = image
            self.view.addSubview(iv)
        }
    }
}

extension UIImagePickerController {
    
}
