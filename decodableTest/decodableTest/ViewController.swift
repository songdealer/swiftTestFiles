//
//  ViewController.swift
//  decodableTest
//
//  Created by MinG._. on 14/01/2020.
//  Copyright © 2020 MinG._. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let baseURL = "https://6uqljnm1pb.execute-api.ap-northeast-2.amazonaws.com/prod"
        let getURL = "/products?skintype=oily&page=1"
        let url = URL(string: "\(baseURL)\(getURL)")!
        
        URLSession.shared.dataTask(with: url) { dat, res, err in
            guard let data = dat else {
                return
            }
            
            if let result = try? JSONDecoder().decode(responseType.self, from: data) {
                print(result.body[0])
            }
        }.resume()
    }

}

struct responseType: Decodable {
    let statusCode: Int
    let body: [ItemType]
    let scanned_count: Int
}

struct ItemType: Decodable {
    let id: Int
    let thumbnail_image: String
    let title: String
    let price: String
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case thumbnail_image
        case title
        case price
        
        case oily = "oily_score"
        case dry = "dry_score"
        case sensitive = "sensitive_score"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)!
        thumbnail_image = try values.decodeIfPresent(String.self, forKey: .thumbnail_image)!
        title = try values.decodeIfPresent(String.self, forKey: .title)!
        price = try values.decodeIfPresent(String.self, forKey: .price)!
        
        if let temp = try? values.decodeIfPresent(Int.self, forKey: .oily) {
            score = temp
        }
        else if let temp = try? values.decodeIfPresent(Int.self, forKey: .dry) {
            score = temp
        }
        else if let temp = try? values.decodeIfPresent(Int.self, forKey: .sensitive) {
            score = temp
        }
        else { score = -1 }
    }
}


/*class OilyItemType: ItemType {
    let oily_score: Int
    
    enum CodingKeys: String, CodingKey {
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        values.decodeIfPresent(String.self, forKey: <#T##OilyItemType.CodingKeys#>)
    }
}

class DryItemType: ItemType {
    let dry_score: Int
}

class SensitiveItemType: ItemType, Decodable {
    let sensitive_score: Int
}*/
