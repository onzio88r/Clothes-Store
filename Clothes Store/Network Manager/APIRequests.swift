//
//  APIRequests.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 20/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

class APIRequests {
    
    static func ListProducts(completion: ((Result<ListProduct,Error>) -> Void)?) {
        
        let networkManager = NetworkManager()
        let session = URLSession.shared
        
        let request = networkManager.urlRequest(callRequest: .listProducts)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.sync {
                if error != nil || data == nil {
                    print("Client error!")
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Client error!"]) as Error
                    completion?(.failure(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    
                    guard let jsonData = data else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                        completion?(.failure(error))
                        return
                    }
                    
                    let productsResult = try decoder.decode(ListProduct.self, from: jsonData)
                    
                    completion?(.success(productsResult))
                    
                    
                } catch {
                    print("JSON error: \(error)")
                }
                
            }
            
        }
        
        task.resume()
        
        
    }
    
    
    static func GetProduct(_ id:Int, completion: ((Result<ProductElement,Error>) -> Void)?) {
        
        let networkManager = NetworkManager()
        let session = URLSession.shared
        
        var urlRequest = networkManager.urlRequest(callRequest: .listProducts).url
        urlRequest?.appendPathComponent(String(id))
        
        guard let request = urlRequest else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Error to create url request component"]) as Error
            completion?(.failure(error))
            return }
        
        print(request)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.sync {
                if error != nil || data == nil {
                    print("Client error!")
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Client error!"]) as Error
                    completion?(.failure(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    
                    guard let jsonData = data else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                        completion?(.failure(error))
                        return
                    }
                    
                    let productsResult = try decoder.decode(ProductElement.self, from: jsonData)
                    
                    completion?(.success(productsResult))
                    
                    
                } catch {
                    print("JSON error: \(error)")
                }
                
            }
            
        }
        
        task.resume()
        
        
    }
    
    
    static func AddCart(_ id:Int, completion: ((Result<CartProduct,Error>) -> Void)?) {
           
           let networkManager = NetworkManager()
           let session = URLSession.shared
        
        let parameters = ["productId": id]
           
           var urlRequest = networkManager.urlRequest(callRequest: .addTocart)
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }
           
        
           
           let task = session.dataTask(with: urlRequest) { data, response, error in
               DispatchQueue.main.sync {
                   if error != nil || data == nil {
                       print("Client error!")
                       let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Client error!"]) as Error
                       completion?(.failure(error))
                       return
                   }
                   
                   guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                       print("Server error!")
                       return
                   }
                   
                   let decoder = JSONDecoder()
                   
                   do {
                       
                       guard let jsonData = data else {
                           let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                           completion?(.failure(error))
                           return
                       }
                       
                       let productsResult = try decoder.decode(CartProduct.self, from: jsonData)
                       
                       completion?(.success(productsResult))
                       
                       
                   } catch {
                       print("JSON error: \(error)")
                   }
                   
               }
               
           }
           
           task.resume()
           
           
       }
       
    
    static func DeleteCart(_ id:Int, completion: ((Result<CartProduct,Error>) -> Void)?) {
        
        let networkManager = NetworkManager()
        let session = URLSession.shared
     
     let parameters = ["productId": id]
        
        var urlRequest = networkManager.urlRequest(callRequest: .addTocart)
         do {
             urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
         } catch let error {
             print(error.localizedDescription)
         }
        
     
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.sync {
                if error != nil || data == nil {
                    print("Client error!")
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Client error!"]) as Error
                    completion?(.failure(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    
                    guard let jsonData = data else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                        completion?(.failure(error))
                        return
                    }
                    
                    let productsResult = try decoder.decode(CartProduct.self, from: jsonData)
                    
                    completion?(.success(productsResult))
                    
                    
                } catch {
                    print("JSON error: \(error)")
                }
                
            }
            
        }
        
        task.resume()
        
        
    }
    
}
