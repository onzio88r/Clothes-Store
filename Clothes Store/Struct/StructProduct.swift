//
//  StructProduct.swift
//  Clothes Store
//
//  Created by Daniele Rapali on 20/01/2020.
//  Copyright © 2020 Daniele Rapali. All rights reserved.
//

import Foundation

// MARK: - ListProductElement
struct ListProductElement: Codable {
    let productID: Int
    let name, category: String
    let price: Double
    let stock: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name, category, price , stock
    }
}

typealias ListProduct = [ListProductElement]