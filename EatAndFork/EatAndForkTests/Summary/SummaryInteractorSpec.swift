//
//  SummaryInteractorSpec.swift
//  EatAndForkTests
//
//  Created by Visarut on 7/7/2566 BE.
//

import Quick
import Nimble
@testable import EatAndFork
import Foundation

class SummaryInteractorSpec: QuickSpec {
    override class func spec() {
        var sut: SummaryInteractor!
        let cartManagerSpy = CartManagerSpy()
        
        beforeEach {
            sut = SummaryInteractor(cartManager: cartManagerSpy)
        }
        
        afterEach {
            sut = nil
        }
        
        describe("Delete cart item") {
            it("deleteItem") {
                sut.deleteItem(request: .init(index: 0))
                
                expect(cartManagerSpy.deleteItemCalled).to(beTrue())
            }
        }
    }
}
