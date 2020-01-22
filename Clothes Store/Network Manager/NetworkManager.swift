//
//  NetworkManager.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 20/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

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
