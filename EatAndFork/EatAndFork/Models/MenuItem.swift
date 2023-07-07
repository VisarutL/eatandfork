//
//  MenuItem.swift
//  EatAndFork
//
//  Created by Visarut on 5/7/2566 BE.
//

import Foundation

struct MenuItem: Codable, Hashable {
    var id: Int
    var name: String
    var desc: String
    var url: String
    var price: Int
    var imageUrl: String
}
