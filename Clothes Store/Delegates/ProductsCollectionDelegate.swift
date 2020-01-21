//
//  ProductsCollectionDelegate.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 21/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation
import UIKit

extension ProductsCollectionViewController {
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {

           case UICollectionView.elementKindSectionHeader:

               let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! SectionHeaderView
               

               headerView.backgroundColor = UIColor.darkGray
               headerView.headerLabel.textColor = .white

               headerView.headerLabel.text = viewModel.categories[indexPath.section]
               
               return headerView

           case UICollectionView.elementKindSectionFooter:
               let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)

               footerView.backgroundColor = UIColor.green
               return footerView

           default:

               assert(false, "Unexpected element kind")
           }
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ProductCollectionViewCell
        cell.loadingIndicator.startAnimating()
        
        let product = viewModel.products[indexPath.row]
        
        //getProduct
        APIRequests.GetProduct(product.productID) { ( response ) in
                   switch response {
                   case .success(let product):
                  
                    cell.loadingIndicator.stopAnimating()

                    self.selectedProduct = product
                    self.performSegue(withIdentifier: "productDetail", sender: self)
                       
                   case .failure(let error):
                       NSLog(error.localizedDescription)
                   }
               }
        
    }
      

}
