//
//  HTTPEnum.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 22/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

enum HTTPRequest: String {
    
    /// HTTP Method available for the API request, associated for each path. The methot function will return the specific
    /// method for the request
    enum HTTPMethods: String {
           case GET, POST, DELETE
    }
    
    case listProducts   = "/products"
    case addTocart      = "/cart"
    
    func method() -> String {
        switch self {
       
        case .listProducts:
            return HTTPMethods.GET.rawValue
        
        case .addTocart:
            return HTTPMethods.POST.rawValue
           
        }
    }
    
}
