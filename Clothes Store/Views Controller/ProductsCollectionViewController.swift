//
//  ProductsCollectionViewController.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 21/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import UIKit

internal let reuseIdentifier = "Cell"

class ProductsCollectionViewController: UICollectionViewController {
    
    var viewModel:ProductsViewModels!
    var selectedProduct: ProductElement!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ProductViewController {
            destination.viewModel = self.selectedProduct
        }
    }
    

   
}
