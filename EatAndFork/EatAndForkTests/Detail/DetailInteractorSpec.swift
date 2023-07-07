//
//  DetailInteractorSpec.swift
//  EatAndForkTests
//
//  Created by Visarut on 7/7/2566 BE.
//

import Quick
import Nimble
@testable import EatAndFork
import Foundation

class DetailInteractorSpec: QuickSpec {
    override class func spec() {
        var sut: DetailInteractor!
        let cartManagerSpy = CartManagerSpy()
        
        beforeEach {
            sut = DetailInteractor(cartManager: cartManagerSpy)
        }
        
        afterEach {
            sut = nil
        }
        
        describe("Get item detail and add item") {
            
            beforeEach {
                sut.menuItem = .init(
                    id: 1, name: "name",
                    desc: "description",
                    url: "url",
                    price: 110,
                    imageUrl: "imageUrl"
                )
            }
            
            it("fetchData") {
                sut.fetchData(request: .init())
                
                expect(cartManagerSpy.getNumberOfMenuCalled).to(beTrue())
                expect(cartManagerSpy.getTotalPriceOfItemsCalled).to(beTrue())
            }
            
            it("addItemToCart") {
                sut.addItemToCart(request: .init())
                
                expect(cartManagerSpy.addItemCalled).to(beTrue())
            }
        }
    }
}

