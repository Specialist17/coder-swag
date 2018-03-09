//
//  ProductCell.swift
//  coder-swag
//
//  Created by Fernando on 3/7/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    func updateViews(product: Product) {
        productImg.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = product.price
    }
}
