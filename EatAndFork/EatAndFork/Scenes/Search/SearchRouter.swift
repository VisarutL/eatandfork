//
//  SearchRouter.swift
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

@objc protocol SearchRoutingLogic {
    func routeToItemDetail(index: Int)
}

protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

final class SearchRouter: SearchRoutingLogic, SearchDataPassing {
    weak var viewController: SearchViewController?
    var dataStore: SearchDataStore?

    func routeToItemDetail(index: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.interactor?.menuItem = dataStore?.currentItems[index]
        detailViewController.modalPresentationStyle = .fullScreen
        viewController?.present(detailViewController, animated: true)
    }
}
