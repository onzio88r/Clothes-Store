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
        
        APIRequests.GetProducts { ( response ) in
            switch response {
            
            case .success(let listProducts):
                dump(listProducts)
            
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
        
    }

}

