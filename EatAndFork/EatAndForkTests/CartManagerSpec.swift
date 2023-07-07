//
//  CartManagerSpec.swift
//  EatAndForkTests
//
//  Created by Visarut on 7/7/2566 BE.
//

import Foundation
import Quick
import Nimble
@testable import EatAndFork

class CartManagerSpec: QuickSpec {
    override class func spec() {
        var sut: CartManagerProtocol = CartManager(cartItemsKey: "cartItemsTest")
        
        beforeEach {
            sut = CartManager()
        }
        
        afterEach {
            sut.clearCart()
        }
        
        describe("Add Item") {
            it("Add item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfMenu()) == 1
            }
        }
        
        describe("Update Item") {
            it("Update selection item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfItems()) == 2
                expect(sut.getNumberOfMenu()) == 1
            }
        }
        
        describe("Delete Item") {
            beforeEach {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
            }
            
            it("Delete item first index") {
                sut.deleteItem(index: 0)
                
                expect(sut.getNumberOfMenu()) == 0
            }
        }
        
        describe("Clear cart") {
            beforeEach {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
            }
            
            it("Clear all item") {
                sut.clearCart()
                
                expect(sut.getNumberOfMenu()) == 0
            }
        }
        
        describe("Get all items") {
            it("Get same item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfMenu()) == 1
            }
            
            it("Get differance item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 2, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfMenu()) == 2
            }
        }
        
        describe("get number of menu") {
            it("same item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfMenu()) == 1
            }
            
            it("diferance item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 2, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfMenu()) == 2
            }
        }
        
        describe("get number of items") {
            it("same item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfItems()) == 2
            }
            
            it("diferance item") {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 2, name: "name",
                            desc: "description",
                            url: "url",
                            price: 1,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                expect(sut.getNumberOfItems()) == 2
            }
        }
        
        describe("get price") {
            beforeEach {
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 1, name: "name",
                            desc: "description",
                            url: "url",
                            price: 110,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
                
                sut.addItem(
                    menuItemSelection: .init(
                        menuItem: .init(
                            id: 2, name: "name",
                            desc: "description",
                            url: "url",
                            price: 140,
                            imageUrl: "imageUrl"
                        ),
                        selectedItem: 1
                    )
                )
            }
            
            it("get total price of items") {
                expect(sut.getTotalPriceOfItems()) == 250
            }
            
            it("get service charge") {
                expect(sut.getServiceCharge()) == 25
            }
            
            it("get vat") {
                expect(sut.getVat()) == 19.25
            }
            
            it("get total") {
                expect(sut.getTotalPriceWithExtra()) == 294.25
            }
        }
    }
}

final class CartManagerSpy: CartManagerProtocol {
    
    var addItemCalled = false
    func addItem(menuItemSelection: EatAndFork.MenuItemSelection) {
        addItemCalled = true
    }
    
    var deleteItemCalled = false
    func deleteItem(index: Int) {
        deleteItemCalled = true
    }
    
    var clearCartCalled = false
    func clearCart() {
        clearCartCalled = true
    }
    
    var getAllItemsCalled = false
    func getAllItems() -> [EatAndFork.CartItem] {
        getAllItemsCalled = true
        return []
    }
    
    var getNumberOfMenuCalled = false
    func getNumberOfMenu() -> Int {
        getNumberOfMenuCalled = true
        return 1
    }
    
    var getNumberOfItemsCalled = false
    func getNumberOfItems() -> Int {
        getNumberOfItemsCalled = true
        return 1
    }
    
    var getTotalPriceOfItemsCalled = false
    func getTotalPriceOfItems() -> Double {
        getTotalPriceOfItemsCalled = true
        return 1
    }
    
    var getServiceChargeCalled = false
    func getServiceCharge() -> Double {
        getServiceChargeCalled = true
        return 1
    }
    
    var getVatCalled = false
    func getVat() -> Double {
        getVatCalled = true
        return 1
    }
    
    var getTotalPriceWithExtraCalled = false
    func getTotalPriceWithExtra() -> Double {
        getTotalPriceWithExtraCalled = true
        return 1
    }
}
