//
//  ViewController.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 20/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //listProduct
        APIRequests.ListProducts { ( response ) in
            switch response {
            
            case .success(let listProducts):
                dump(listProducts)
            
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
        
        //getProduct
        APIRequests.GetProduct(1) { ( response ) in
            switch response {
            case .success(let listProducts):
                dump(listProducts)
                
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
        
    }

}

