//
//  ProductsDataSource.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 21/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation
import UIKit

extension ProductsCollectionViewController {
    // MARK: UICollectionViewDataSource

      override func numberOfSections(in collectionView: UICollectionView) -> Int {
          // #warning Incomplete implementation, return the number of sections
        return viewModel.categories.count
      }


      override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of items
        return viewModel.products.compactMap({$0.category == viewModel.categories[section ]}).count
      }

      override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
      
        let product = viewModel.products[indexPath.row]
        
        cell.setup(with: product)
        
          return cell
      }
}
