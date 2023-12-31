//
//  SearchInteractor.swift
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

protocol SearchBusinessLogic {
    func filterByText(request: Search.Filter.Request)
}

protocol SearchDataStore {
    var menuItems: [MenuItem] { get set }
    var currentItems: [MenuItem] { get set }
}

final class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    var menuItems: [MenuItem] = []
    var currentItems: [MenuItem] = []
    
    var presenter: SearchPresentationLogic?
    private var worker: SearchWorker = SearchWorker()

    func filterByText(request: Search.Filter.Request) {
        currentItems = worker.filterMenuItemsByText(searchText: request.text, menuItems: menuItems)
        presenter?.presentFilterMenuItems(response: .init(menuItems: currentItems))
    }
}
