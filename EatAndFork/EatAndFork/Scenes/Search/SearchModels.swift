//
//  SearchModels.swift
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

enum Search {
    enum Section: Hashable {
        case search
    }
    // MARK: Use cases

    enum Filter {
        struct Request {
            let text: String
        }

        struct Response {
            let menuItems: [MenuItem]
        }
        
        struct ViewModel {
            let itemViewModels: [ItemViewModel]
        }
    }
}
