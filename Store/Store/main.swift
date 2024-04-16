//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    
    var name: String {get set}
    
    func price() -> Int
    
}

class Item:SKU {
    
    var name: String
    var priceEach: Int
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
    
}

class Receipt {
    
    var scanned:[SKU] = []
    
    func addItem(_ item:SKU) {
        scanned.append(item)
    }
    
    func items() -> [SKU] {
        return scanned
    }
    
    func subtotal() -> Int {
        
        var cuml_price = 0
        for item in scanned {
            cuml_price += item.price()
        }
        return cuml_price
        
    }
    
    func output() -> String {
        var receiptText = "Receipt:\n"
            for item in scanned {
                receiptText += "\(item.name): $\(String(format: "%.2f", Double(item.price()) / 100))\n"
            }
            receiptText += "------------------\n"
            receiptText += "TOTAL: $\(String(format: "%.2f", Double(total()) / 100))"
            return receiptText
    }
    
    func total() -> Int {
        
        return subtotal()

    }
    
}

class Register {
    
    var receipt:Receipt
    
    init() {
        self.receipt = Receipt()
    }
    
    func scan(_ sku:SKU) {
        
        receipt.addItem(sku)
        
    }
    
    func subtotal() -> Int {
        
        return receipt.subtotal()
        
    }
    
    func total() -> Receipt {
        
        return receipt

    }
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

