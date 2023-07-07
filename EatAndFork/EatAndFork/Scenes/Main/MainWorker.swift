//
//  MainWorker.swift
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
import Alamofire

final class MainWorker {
    func fetchMenuItems(completion: @escaping ([MenuItem]) -> Void)  {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request("https://63bd4463d6600623889f97ea.mockapi.io/menus").responseDecodable(of: [MenuItem].self, decoder: decoder) { response in
            completion(response.value ?? [])
        }
            
//        if let url = URL(string: "https://63bd4463d6600623889f97ea.mockapi.io/menus") {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//                    do {
//                        let response = try JSONDecoder().decode([MenuItem].self, from: data)
//                        completion(response)
//                    } catch {
//                        completion([])
//                    }
//                }
//            }.resume()
//        }
    }
}
