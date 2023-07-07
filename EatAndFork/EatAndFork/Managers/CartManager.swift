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
    func getItemById(id: Int) -> CartItem?
    func getAllItems() -> [CartItem]
    func getNumberOfItems() -> Int
    func getTotalPrice() -> Double
}

final class CartManager: CartManagerProtocol {
    
    private let cartItemsKey = "cartItems"
    
    static let shared = CartManager()
    
    private var cartItems: [CartItem] = []
    
    init() {
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
    }
    
    func getItemById(id: Int) -> CartItem? {
        return cartItems.first { $0.id == id }
    }
    
    func getAllItems() -> [CartItem] {
        return cartItems
    }
    
    func getNumberOfItems() -> Int {
        return cartItems.reduce(0, { $0 + $1.numberOfItem })
    }
    
    func getTotalPrice() -> Double {
        return Double(cartItems.reduce(0) { $0 + ($1.numberOfItem * $1.price) })
    }
    
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(cartItems) {
            UserDefaults.standard.set(encoded, forKey: cartItemsKey)
        }
    }
}
