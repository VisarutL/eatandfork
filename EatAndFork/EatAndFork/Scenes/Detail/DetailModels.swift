//
//  DetailModels.swift
//  EatAndFork
//
//  Created by Visarut on 6/7/2566 BE.
//  Copyright (c) 2566 BE Newfml. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Detail {
    
    enum AddItem {
        case plus, minus
    }
    // MARK: Use cases

    enum FetchData {
        struct Request {}

        struct Response {
            let menuItem: MenuItem
            let numberOfItemsInCart: Int
            let totalPrice: Double
        }

        struct ViewModel {
            let imageUrl: String
            let title: String
            let price: String
            let description: String
            let numberOfItemsInCart: String
            let totalPrice: String
        }
    }
    
    enum AdjustItem {
        struct Request {
            let addItem: AddItem
        }

        struct Response {
            let menuItem: MenuItem
            let numberOfItem: Int
        }

        struct ViewModel {
            let totalItemPrice: String
            let numberOfItem: Int
        }
    }
    
    enum AddItemToCart {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
}