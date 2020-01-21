//
//  ProductsViewModel.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 21/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

class ProductsViewModels {
    
    var categories = [String]()
    var products = ListProduct()
    
    init(products: ListProduct) {
        self.categories = products.compactMap({$0.category})
        self.products = products
    }
    
}
