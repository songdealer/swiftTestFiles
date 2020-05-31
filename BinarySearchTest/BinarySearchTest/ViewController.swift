//
//  ViewController.swift
//  BinarySearchTest
//
//  Created by MinG._. on 2020/02/09.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myArray = [1.101, 1.103, 2.103, 2.222, 2.232, 3.0, 3.1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 1.10)) // 1.101
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 1.101)) // 1.101
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 1.102)) // 1.101
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 1.103)) // 1.103
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 2.01)) // 1.103
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 2.102)) // 1.103
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 2.103)) // 2.103
        print(lowerBoundBinarySearch(inputArr: myArray, searchItem: 2.223)) // 2.222
        
        // Do any additional setup after loading the view.
    }

    func lowerBoundBinarySearch<T:Comparable>(inputArr: Array<T>, searchItem: T) -> T {
        var lowerIndex = 0;
        var upperIndex = inputArr.count - 1

        while (true) {
            let currentIndex = (lowerIndex + upperIndex) / 2
            if (lowerIndex > upperIndex) {
                return inputArr[currentIndex]
            } else {
                if (inputArr[currentIndex] > searchItem) {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
        }
    }
}
