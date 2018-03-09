//
//  ProductVC.swift
//  coder-swag
//
//  Created by Fernando on 3/7/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController {
    
    private(set) public var products = [Product]()
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.dataSource = self
        productsCollection.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
}

extension ProductsVC: UICollectionViewDelegate {
    
}

extension ProductsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return ProductCell()}
        
        let product = products[indexPath.row]
        cell.updateViews(product: product)
        
        return cell
    }
}
