//
//  ViewModel.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

class ViewModel {
    var books = [Book]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.BookNotification, object: nil, userInfo: userInfo)
        }
    }
    
    func get(search: String) {
        
        BookService.shared.getBooks(for: search) { [weak self] bookss in
            self?.books = bookss
            print("Books count: \(bookss.count)")
        }
    }
}
