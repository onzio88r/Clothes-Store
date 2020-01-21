//
//  ProductViewController.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 21/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var stock: UILabel!
    
    var viewModel:ProductElement!
    
}

extension ProductViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = viewModel.name
        category.text = viewModel.category
        price.text = String(viewModel.price)
        stock.text = String(viewModel.stock)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
