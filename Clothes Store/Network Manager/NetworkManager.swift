//
//  NetworkManager.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 20/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

enum HTTPRequest: String {
    
    /// HTTP Method available for the API request, associated for each path. The methot function will return the specific
    /// method for the request
    enum HTTPMethods: String {
           case GET, POST, DELETE
    }
    
    case listProducts                  = "/products"
    case addTocart,removeFromCart      = "/cart"
    
    
    func method() -> String {
        switch self {
       
        case .listProducts:
            return HTTPMethods.GET.rawValue
        
        case .addTocart:
            return HTTPMethods.POST.rawValue
            
        case .removeFromCart:
            return HTTPMethods.DELETE.rawValue
        }
    }
    
   static func getProduct(_ id:Int) -> String {
        var mainPath = HTTPRequest.listProducts.rawValue
        mainPath.append(String(id))
        return mainPath
    }
}


class NetworkManager: NSObject {
    
   private func requestURLComponent(requestPath: HTTPRequest) -> URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "private-anon-83e7d0b135-ddshop.apiary-mock.com"
        component.path = requestPath.rawValue
        
        return component
        
    }
    
    func urlRequest(callRequest: HTTPRequest) -> URLRequest{
        
        let urlComponent = self.requestURLComponent(requestPath: callRequest)
        guard let url = urlComponent.url else { fatalError("Could not create URL from components") }

        var request = URLRequest(url: url)
           request.httpMethod = callRequest.method()
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
           return request
       }
    
}
