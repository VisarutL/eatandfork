//
//  MainInteractorSpec.swift
//  EatAndForkTests
//
//  Created by Visarut on 7/7/2566 BE.
//

import Quick
import Nimble
@testable import EatAndFork
import Foundation

class MainInteractorSpec: QuickSpec {
    override class func spec() {
        var sut: MainInteractor!
        let cartManagerSpy = CartManagerSpy()
        
        beforeEach {
            sut = MainInteractor(cartManager: cartManagerSpy)
        }
        
        afterEach {
            sut = nil
        }
        
        describe("Get cart item and total price") {
            it("fetchMemuItems") {
                sut.fetchMemuItems(request: .init())
                
                expect(cartManagerSpy.getAllItemsCalled).to(beTrue())
            }
            
            it("fetchCartItems") {
                sut.fetchCartItems(request: .init())
                
                expect(cartManagerSpy.getAllItemsCalled).to(beTrue())
                expect(cartManagerSpy.getTotalPriceOfItemsCalled).to(beTrue())
            }
        }
    }
}
