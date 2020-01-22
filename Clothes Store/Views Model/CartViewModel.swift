//
//  CartViewModel.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 22/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

class CartViewModel: NSObject {
    
     struct Static
      {
           static var instance: CartViewModel?
      }
      
      class var sharedInstance: CartViewModel
      {
          if Static.instance == nil
          {
              Static.instance = CartViewModel()
          }
          
          return Static.instance!
      }
      
    
    var cartProducts = [CartProduct]()
    var listProducts = ListProduct()
}
