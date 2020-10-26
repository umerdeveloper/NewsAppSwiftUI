//
//  Constants.swift
//  NewAppSwiftUI
//
//  Created by Umer Khan on 01/10/2020.
//

import Foundation
class Constants {
    
    private init() { }
    
    static let shared = Constants()
    let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
}
