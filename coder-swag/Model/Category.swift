//
//  Category.swift
//  coder-swag
//
//  Created by Fernando on 3/5/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import UIKit

struct Category {
    // private(set) means that you want public variables to be fetched but not set
    // by outside clases, unless that's what your class calls for
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName 
    }
}
