//
//  ViewController.swift
//  Temp
//
//  Created by MinG._. on 2020/02/22.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alertVC = UIAlertController(title: "URL을 입력하세요.", message: nil, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Cancel", style: .cancel) { action in
            alertVC.dismiss(animated: true)
        }
        
        var tf: UITextField?
        
        let action2 = UIAlertAction(title: "OK", style: .default) { action in
            print(tf?.text)
            alertVC.dismiss(animated: true)
        }
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        
        alertVC.addTextField(configurationHandler: { textf in
            tf = textf
        })
        
        present(alertVC, animated: true)
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        let v = UIImageView()
        v.contentMode = .scaleToFill
        
        let uuid = UUID().uuidString
        v.accessibilityIdentifier = "\(uuid)"
        
        let random: [String] = ["camera"]
        
        let str = random.randomElement()!
        v.image = UIImage(named: str)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        let topAnchor = v.topAnchor.constraint(equalTo: contentView.topAnchor)
        topAnchor.identifier = "top\(v.accessibilityIdentifier!)"
        
        let bottomAnchor = v.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomAnchor.identifier = "bottom\(v.accessibilityIdentifier!)"
        
        let widthAnchor = v.widthAnchor.constraint(equalTo: contentView.heightAnchor)
        widthAnchor.identifier = "width\(v.accessibilityIdentifier!)"
        
        if let lastView = contentView.subviews.last {
            contentView.addSubview(v)
            
            let leadingAnchor = v.leadingAnchor.constraint(equalTo: lastView.trailingAnchor)
            leadingAnchor.identifier = "leading\(v.accessibilityIdentifier!)"
            
            let constraints = [topAnchor, bottomAnchor, widthAnchor, leadingAnchor]
            
            NSLayoutConstraint.activate(constraints)
            
            //contentView.addConstraints(constraints)
            
            //let contentViewWid = contentView.widthAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: CGFloat(contentView.subviews.count))
            
            //scrollView.addConstraint(contentViewWid)
            //print(scrollView.heightAnchor)
            
            
            print(scrollView.constraints.contains(contentView.widthAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.0)))
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: CGFloat(contentView.subviews.count)).isActive = true
            
            contentViewWidth.constant += scrollView.frame.height
        }
        else {
            contentViewHeight.constant += scrollView.frame.height
            contentView.addSubview(v)
            
            let leadingAnchor = v.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            leadingAnchor.identifier = "leading\(v.accessibilityIdentifier!)"
            
            let constraints = [topAnchor, bottomAnchor, widthAnchor, leadingAnchor]
            NSLayoutConstraint.activate(constraints)
            //contentView.addConstraints(constraints)
        }
        
    }
    @IBAction func btn2Clicked(_ sender: Any) {
        let indexTemp = scrollView.contentOffset.x / scrollView.frame.width
        let index = Int(indexTemp)
        
        let deletedView = contentView.subviews[index]

        if contentView.subviews.count == 1 {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.contentViewHeight.constant = 0
                self.contentView.layoutIfNeeded()
            }, completion: { bool in
                deletedView.removeFromSuperview()
            })
            
        }
        else {
            var cons: NSLayoutConstraint?

            for i in contentView.constraints {
                if i.identifier == "width\(deletedView.accessibilityIdentifier!)" {
                    cons = i
                    break
                }
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                //cons!.isActive = false // = remove Constraint
                //deletedView.widthAnchor.constraint(equalToConstant: 0).isActive = true // = add Constraint
                cons?.constant -= self.contentView.frame.height - 1
                self.contentViewWidth.constant -= self.scrollView.frame.height
                
                self.scrollView.layoutIfNeeded()
            }, completion: { bool in
                
                if index != self.contentView.subviews.count - 1 {
                    var leading: NSLayoutXAxisAnchor?
                    
                    if index ==  0 {
                        leading = self.contentView.leadingAnchor
                        
                    }
                    else {
                        leading = self.contentView.subviews[index - 1].trailingAnchor
                    }
                    
                    let nextView = self.contentView.subviews[index + 1]
                    for i in self.contentView.constraints {
                        if i.identifier == "leading\(nextView.accessibilityIdentifier!)" {
                            cons = i
                            break
                        }
                    }
                    
                    cons!.isActive = false
                    let newLeading = nextView.leadingAnchor.constraint(equalTo: leading!)
                    newLeading.identifier = "leading\(nextView.accessibilityIdentifier!)"
                    newLeading.isActive = true
                    
                    self.contentView.layoutIfNeeded()

                    
                }
                    //deletedView.removeFromSuperview()
                
                
            })
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toVC = segue.destination as! URLViewController
        toVC.viewModel.modeInput.onNext("test2")
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
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
