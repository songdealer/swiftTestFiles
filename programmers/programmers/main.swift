//
//  main.swift
//  programmers
//
//  Created by MinG._. on 2020/05/23.
//  Copyright © 2020 MinG._. All rights reserved.
//

import Foundation

/*func solution(_ p: Int) -> Int {
    var answer = p + 1
    var temp = answer
    
    while temp != 0 {
        
        var check = [Int](repeating: 0, count: 10)
        temp = answer
        
        while temp != 0 {
            if check[temp%10] == 0 {
                check[temp%10] += 1
            }
            else {
                answer += 1
                break
            }
            temp /= 10
        }
    }
    print(answer)
    return answer
}

func solution(_ n: Int64) -> Int64 {
    var answer: Int64 = 1
    var number = n
    var bits: Int64 = 1
    
    while number > 0 {
        number -= bits
        bits *= 2
    }
    
    bits /= 2
    number += bits
    
    while bits != 0 {
        answer *= 3
        bits /= 2
    }
    answer /= 3
    
    number -= 1
    
    var e: Int64 = 1
    while number != 0 {
        var bit = number % 2
        answer += e * bit
        e *= 3
        number /= 2
    }
    
    /*n = 1, d = 1 1 3^0
    n = 1, d = 2 2   3^1
    n = 2, d = 2 3   3^1 + 3^0
    n = 1, d = 4 4   3^2
        2        5   3^2 + 3^0
        3        6   3^2 + 3^1
        4        7   3^2 + 3^1 + 3^0
        1      8 8   3^3
    */
    print(answer)
    return answer
}
*/

struct data {
    var w: Int
    var ch: [Int]
}

func solution(_ total_sp:Int, _ skills:[[Int]]) -> [Int] {
    
    var all = [data]()
    for i in 0...skills.count {
        all.append(data(w: 0, ch: [Int]()))
    }
    
    for sk in skills {
        var number = sk[0]
        var child = sk[1]
        
        all[number].ch.append(child)
    }
    
    for dat in all {
        if dat.ch.count == 0 {
            dat.w = 1
        }
    }
    return []
    
}

solution(121, [[1,2], [1,3], [3,6], [3,4], [3,5]])

/*3^0
3^1
3^1 + 3^0
3^2
3^2 + 3^0
3^2 + 3^1
3^2 + 3^1 + 3^0
3^3
3^3 + 3^0
3^3 + 3^1
3^3 + 3^1 + 3^0
3^3 + 3^2
3^3 + 3^2 + 3^0
3^3 + 3^2 + 3^1
3^3 + 3^2 + 3^1 + 3^0*/
