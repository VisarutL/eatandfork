//
//  MainPresenter.swift
//  EatAndFork
//
//  Created by Visarut on 4/7/2566 BE.
//  Copyright (c) 2566 BE Newfml. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainPresentationLogic {
    func presentMenuItems(response: Main.FetchMenus.Response)
    func presentCartItems(response: Main.FetchCart.Response)
}

final class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?
    
    func presentMenuItems(response: Main.FetchMenus.Response) {
        let viewModels = response.menuItems.compactMap { item in
            ItemViewModel(
                imageUrl: item.imageUrl,
                name: item.name,
                price: item.price.description.Baht(),
                numberOfItem: response.cartItems.first(where: { $0.id == item.id })?.numberOfItem.description
            )
        }
        viewController?.displayMenuItems(
            viewModel: .init(
                itemViewModels: viewModels
            )
        )
    }
    
    func presentCartItems(response: Main.FetchCart.Response) {
        viewController?.displayCartItems(
            viewModel: .init(
                totalPriceOfItems: response.totalPriceOfItems.description.Baht(),
                isHiddenCheckoutButton: response.isHiddenCheckoutButton
            )
        )
    }
}
