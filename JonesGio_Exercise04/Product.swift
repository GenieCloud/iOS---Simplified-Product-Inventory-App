//
//  Product.swift
//  Code_Exercise04
//
//  Created by Gio on 12/16/25.
//

import Foundation

class Product
{
    // 3 Stored properties
    var name: String
    var quantity: Int
    var price: Double
    
    // 2 Computed properties
    var totalValue: Double
    {
        return Double(quantity) * price
    }
    
    var inventoryStatus: String
    {
        if quantity > 0
        {
            return "In stock (\(quantity) units)"
        } else {
            return "Out of stock"
        }
    }
    
    // 2 Intializers
    
    //Default initializer
    init()
    {
        self.name = "Item Unavailable"
        self.quantity = 0
        self.price = 0.00
    }
    
    // Custom initializer
    init(name: String, quantity: Int, price: Double)
    {
        self.name = name
        self.quantity = quantity
        self.price = price
    }
    
    //Instance methods
    func buy(amount: Int)-> String
    {
        quantity += amount
        return "You bought \(amount) \(name). This item's inventory status is: \(inventoryStatus)."
    }
    
    func sell(amount: Int)-> String
    {
        if quantity >= amount {
            
            quantity -= amount
            
            return "You sold \(amount) \(name). This item's inventory status is: \(inventoryStatus)."
        } else {
            return "You cannot sell more items than you currently have in stock. You have \(quantity) \(name) on hand."
        }
    }
}
