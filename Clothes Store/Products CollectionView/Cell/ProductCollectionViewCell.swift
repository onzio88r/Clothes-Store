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
    @IBOutlet weak var errorMessage: UILabel!
    
    private var cartQuantity = 0 {
        didSet {
            if cartQuantity > stock {
                disableCart()
                showError(message: "Max \(stock) items")
            }else {
                enableCart()
                removeError()
            }
            
        }
    }
    private var stock = 0

    override func awakeFromNib() {
           super.awakeFromNib()
        
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 3
        self.layer.borderColor = UIColor.black.cgColor
        
        self.errorMessage.isHidden = true
        
        self.addToCart.setTitle("Out of Stock", for: .disabled)
        self.addToCart.setTitleColor(.red, for: .disabled)
        
        self.quantitySelected.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

       }
    
    func setup(with product: ProductElement) {
        self.name.text = product.name
        self.quantityAvailable.text = "stock: \(product.stock)"
        self.stock = product.stock
        
        if stock == 0 {
           disableCart()
        }else {
            enableCart()
        }
        
    }
    
    @IBAction func addToCart(_ sender: Any) {
       
        if let quantity = Int(quantitySelected.text!){
            
            cartQuantity = quantity
            
        }
        
        
    }
    
    private func showError(message:String) {
        self.errorMessage.isHidden = false
        self.errorMessage.text = message
    }
    
    private func removeError(){
        self.errorMessage.isHidden = true
        self.errorMessage.text = ""
    }
    
    private func disableCart(){
        self.addToCart.isEnabled = false
    }
    
    private func enableCart(){
        self.addToCart.isEnabled = true
    }
}

extension ProductCollectionViewCell  {
    @objc func textFieldDidChange(){
        if let quantity = Int(self.quantitySelected.text!) {
            cartQuantity = quantity
        }
    }
}
