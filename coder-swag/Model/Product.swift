//
//  Product.swift
//  coder-swag
//
//  Created by Fernando on 3/7/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    init(title: String, price: String, imageName: String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
