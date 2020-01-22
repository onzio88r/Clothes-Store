//
//  ViewController.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 20/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var products = ListProduct()
}

extension ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //listProduct
        APIRequests.ListProducts { ( response ) in
            switch response {
            
            case .success(let listProducts):
            
                self.products = listProducts
                
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
        
    }

    
    /// Show catalog action
    /// - Parameter sender: 
    @IBAction func showCatalog(_ sender: Any) {
        self.performSegue(withIdentifier: "showCatalog", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCatalog" {
            
            if let navigationCtrl = segue.destination as? UINavigationController {
                if let productCtrl = navigationCtrl.topViewController as? ProductsCollectionViewController {
                    productCtrl.viewModel = ProductsViewModels(products: self.products)
                }
            }
        }
    }
}

