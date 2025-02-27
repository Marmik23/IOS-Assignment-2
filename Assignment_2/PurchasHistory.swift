//
//  PurchasHistory.swift
//  Assignment_2
//
//  Created by Marmik Nalinkumar Patel on 2025-02-26.
//

import Foundation

class PurchaseHistory {
    let name: String
    let quantity: Int
    let totalPrice: Double
    let purchaseDate: Date
    
    init(name: String, quantity: Int, totalPrice: Double, purchaseDate: Date) {
        self.name = name
        self.quantity = quantity
        self.totalPrice = totalPrice
        self.purchaseDate = purchaseDate
    }
    
}
