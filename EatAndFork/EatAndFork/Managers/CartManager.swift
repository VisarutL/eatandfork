//
//  CartManager.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//

import Foundation

struct CartItem: Codable {
    let id: Int
    let name: String
    let price: Int
    let imageUrl: String
    var numberOfItem: Int
    
    init(menuItemSelection: MenuItemSelection) {
        id = menuItemSelection.id
        name = menuItemSelection.name
        price = menuItemSelection.price
        imageUrl = menuItemSelection.imageUrl
        numberOfItem = menuItemSelection.numberItemOfSelection
    }
}

struct MenuItemSelection {
    let id: Int
    let name: String
    let price: Int
    let imageUrl: String
    let numberItemOfSelection: Int
    
    init(menuItem: MenuItem, selectedItem: Int) {
        id = menuItem.id
        name = menuItem.name
        price = menuItem.price
        imageUrl = menuItem.imageUrl
        numberItemOfSelection = selectedItem
    }
}

protocol CartManagerProtocol {
    func addItem(menuItemSelection: MenuItemSelection)
    func deleteItem(index: Int)
    func clearCart()
    func getAllItems() -> [CartItem]
    func getNumberOfMenu() -> Int
    func getNumberOfItems() -> Int
    func getTotalPriceOfItems() -> Double
    func getServiceCharge() -> Double
    func getVat() -> Double
    func getTotalPriceWithExtra() -> Double
}

final class CartManager: CartManagerProtocol {
    
    private let cartItemsKey: String
    
    static let shared = CartManager()
    
    private var cartItems: [CartItem] = []
    
    init(cartItemsKey: String = "cartItems") {
        self.cartItemsKey = cartItemsKey
        if
            let data = UserDefaults.standard.object(forKey: cartItemsKey) as? Data,
            let items = try? JSONDecoder().decode([CartItem].self, from: data)
        {
            cartItems = items
        }
    }
    
    func addItem(menuItemSelection: MenuItemSelection) {
        if let index = cartItems.firstIndex(where: { $0.id == menuItemSelection.id }) {
            cartItems[index].numberOfItem += menuItemSelection.numberItemOfSelection
            saveData()
        } else {
            let cartItem = CartItem(menuItemSelection: menuItemSelection)
            cartItems.append(cartItem)
            saveData()
        }
    }
    
    func deleteItem(index: Int) {
        cartItems.remove(at: index)
        saveData()
    }
    
    func clearCart() {
        cartItems = []
        saveData()
    }
    
    func getAllItems() -> [CartItem] {
        return cartItems
    }
    
    func getNumberOfMenu() -> Int {
        return cartItems.count
    }
    
    func getNumberOfItems() -> Int {
        return cartItems.reduce(0, { $0 + $1.numberOfItem })
    }
    
    func getTotalPriceOfItems() -> Double {
        return Double(cartItems.reduce(0) { $0 + ($1.numberOfItem * $1.price) })
    }
    
    func getServiceCharge() -> Double {
        return ((getTotalPriceOfItems() * 10) / 100)
    }
    
    func getVat() -> Double {
        return (((getTotalPriceOfItems() + getServiceCharge()) * 7) / 100)
    }
    
    func getTotalPriceWithExtra() -> Double {
        return (getTotalPriceOfItems() + getServiceCharge() + getVat())
    }
    
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(cartItems) {
            UserDefaults.standard.set(encoded, forKey: cartItemsKey)
        }
    }
}
