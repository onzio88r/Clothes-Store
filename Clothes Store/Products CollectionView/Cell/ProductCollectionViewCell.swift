//
//  ProductCollectionViewCell.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 21/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantityAvailable: UILabel!
    @IBOutlet weak var quantitySelected: UITextField!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var cartQuantity = 0

    override func awakeFromNib() {
           super.awakeFromNib()
        
        self.addToCart.setTitle("Out of Stock", for: .disabled)
        self.addToCart.setTitleColor(.red, for: .disabled)
        
       }
    
    func setup(with product: ProductElement) {
        self.name.text = product.name
        self.quantityAvailable.text = "stock: \(product.stock)"
        
        if product.stock == 0 {
            
            self.addToCart.isEnabled = false
        }
        
    }
    
    @IBAction func addToCart(_ sender: Any) {
       
        if let quantity = Int(quantitySelected.text!){
            print(quantity)
            
        }
        
        
    }
    
}
