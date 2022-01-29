//
//  BountyInfo.swift
//  BountyList
//
//  Created by 엄철찬 on 2022/01/23.
//

import UIKit

struct BountyInfo {
    let name   : String
    let bounty : Int
    // \(name).jpg 방식으로 접근하기 때문에 옵셔널
    var image  : UIImage? {
        return UIImage(named:"\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name   = name
        self.bounty = bounty
    }
}
