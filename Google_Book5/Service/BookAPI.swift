//
//  BookAPI.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

struct BookAPI {
    //https://www.googleapis.com/books/v1/volumes?q=
    var search: String!
    
    init(search: String) {
        self.search = search
    }
    
    let base = "https://www.googleapis.com/books/v1/volumes?q="
    
    var getURL: URL? {
        return URL(string: base + search)
    }
}
