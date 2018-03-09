//
//  ViewController.swift
//  coder-swag
//
//  Created by Fernando on 3/5/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.delegate = self
        categoryTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
        }
    }
}

extension CategoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
}

extension CategoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoryTable.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {return CategoryCell()}
        
        let categories = DataService.instance.getCategories()
        
        cell.updateViews(category: categories[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
