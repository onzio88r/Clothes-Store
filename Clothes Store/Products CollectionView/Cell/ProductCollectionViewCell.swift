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
    
    
    /// Quantity to add in the cart
    private var cartQuantitySelected = 0 {
        didSet {
            if cartQuantitySelected > stockQuantity {
                disableCart()
                showError(message: "Max \(stockQuantity) items")
            }else {
                enableCart()
                removeError()
            }
            
        }
    }
    
    
    /// Quantity available in stock
    private var stockQuantity = 0 {
        didSet {
            self.quantityAvailable.text = "stock: \(stockQuantity)"
            
            if stockQuantity == 0 {
                disableCart()
            }else {
                enableCart()
            }
            
        }
    }
    
    
    private var productID:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // View configuration
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 3
        self.layer.borderColor = UIColor.black.cgColor
        
        self.errorMessage.isHidden = true
        
        // button style configuration
        self.addToCart.setTitle("Out of Stock", for: .disabled)
        self.addToCart.setTitleColor(.red, for: .disabled)
        
        // custom delegate for the textField
        self.quantitySelected.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    
    /// Setup of the cell, give to this function the product info to show
    /// - Parameter product: Product data to show
    func setup(with product: ProductElement) {
        self.productID = product.productID
        self.name.text = product.name
        stockQuantity = product.stock
        
    }
    
    
    /// Button action, will call the api request to add a product in the cart
    /// - Parameter sender: button, we don't need to define the type for this case, it's ok use any
    @IBAction func addToCart(_ sender: Any) {
        
        if let quantity = Int(quantitySelected.text!){
            
            cartQuantitySelected = quantity
            
            // Add the product in the cart
            APIRequests.AddCart(self.productID) { (response) in
                
                switch response {
                case .success(let cartProduct ):
                    print(cartProduct)
                    self.stockQuantity -= self.cartQuantitySelected
                    
                    CartManager.cartProducts.append(cartProduct)
                    
                    
                case .failure(let error) :
                    NSLog(error.localizedDescription)
                    
                }
            }
            
        }
        
    }
    
    
    /// Function to show a label with the error
    /// - Parameter message: Message for the user
    private func showError(message:String) {
        self.errorMessage.isHidden = false
        self.errorMessage.text = message
    }
    
    // Remove the error from the view
    private func removeError(){
        self.errorMessage.isHidden = true
        self.errorMessage.text = ""
    }
    
    // Disabel the add to cart button
    private func disableCart(){
        self.addToCart.isEnabled = false
    }

    // Enable the add to cart button
    private func enableCart(){
        self.addToCart.isEnabled = true
    }
}

//MARK: TextField Delegate
extension ProductCollectionViewCell  {
    @objc func textFieldDidChange(){
        if let quantity = Int(self.quantitySelected.text!) {
            cartQuantitySelected = quantity
        }
    }
}
