//
//  ViewModel.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

protocol BookDelegate: class {
    func update()
}

protocol FavoriteDelegate: class {
    func update()
}

class ViewModel {
    weak var bookDelegate: BookDelegate!
    weak var favDelegate: FavoriteDelegate!
    
    var books = [Book]() {
        didSet {
//            let userInfo: [String:ViewModel] = ["ViewModel":self]
//            NotificationCenter.default.post(name: Notification.Name.BookNotification, object: nil, userInfo: userInfo)
            bookDelegate?.update()
        }
    }
    
    var favbooks = [Book]() {
        didSet {
            favDelegate?.update()
        }
    }
    

    var book: Book!
    
    func get(search: String) {
        
        BookService.shared.getBooks(for: search) { [weak self] bookss in
            self?.books = bookss
            print("Books count: \(bookss.count)")
        }
    }
    
    func like() {
        
    }
    
    func unlike() {
        
    }
}
