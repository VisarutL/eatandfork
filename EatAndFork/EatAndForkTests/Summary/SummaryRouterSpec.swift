//
//  SummaryRouterSpec.swift
//  EatAndForkTests
//
//  Created by Visarut on 7/7/2566 BE.
//

import Quick
import Nimble
@testable import EatAndFork
import Foundation

class SummaryRouterSpec: QuickSpec {
    override class func spec() {
        var sut: SummaryRouter!
        let cartManagerSpy = CartManagerSpy()
        
        beforeEach {
            sut = SummaryRouter(cartManager: cartManagerSpy)
        }
        
        afterEach {
            sut = nil
        }
        
        describe("Should clear cart when go to thank you ") {
            it("clear cart should call") {
                sut.routeToThankyou()
                
                expect(cartManagerSpy.clearCartCalled).to(beTrue())
            }
        }
    }
}
