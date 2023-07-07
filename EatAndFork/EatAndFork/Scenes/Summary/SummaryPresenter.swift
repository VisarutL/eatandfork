//
//  SummaryPresenter.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//  Copyright (c) 2566 BE Newfml. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SummaryPresentationLogic {
    func presentData(response: Summary.FetchData.Response)
}

final class SummaryPresenter: SummaryPresentationLogic {
    weak var viewController: SummaryDisplayLogic?

    func presentData(response: Summary.FetchData.Response) {
        let cartItemViewModels = response.cartItems.compactMap { item in
            Summary.Row.items(
                .init(
                    imageUrl: item.imageUrl,
                    numberOfItem: "\(item.numberOfItem.description)x",
                    title: item.name,
                    price: (item.price * item.numberOfItem).description.Baht()
                )
            )
        }
        
        let serviceCharge = ((response.totalPrice * 10) / 100).roundToTwoDecimal()
        let vat = ((serviceCharge * 8) / 100).roundToTwoDecimal()
        let total = (response.totalPrice + serviceCharge + vat).roundToTwoDecimal()
        
        var priceDetailViewModels = [
            Summary.Row.priceDetail(
                .init(
                    title: "รวมค่าอาหาร",
                    price: response.totalPrice.description,
                    style: .normal
                )
            )
        ]
        
        priceDetailViewModels.append(
            .priceDetail(
                .init(
                    title: "ค่าบริการ 10%",
                    price: serviceCharge.description,
                    style: .normal
                )
            )
        )
        
        priceDetailViewModels.append(
            .priceDetail(
                .init(
                    title: "ภาษี 7%",
                    price: vat.description,
                    style: .normal
                )
            )
        )
        
        priceDetailViewModels.append(
            .priceDetail(
                .init(
                    title: "ราคารวม",
                    price: total.description,
                    style: .bold
                )
            )
        )
        viewController?.displayData(
            viewModel: .init(
                summaryItemListViewModels: cartItemViewModels,
                priceDetailViewModels: priceDetailViewModels,
                totalPrice: total.description.Baht()
            )
        )
    }
}

extension Double {
    func roundToTwoDecimal() -> Double {
        return ceil(self * 100) / 100
    }
}