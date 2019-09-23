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
    
    func like(book: Book) {
        CoreManager.shared.save(book)
        
    }
    
    func unlike(book: Book) {
        CoreManager.shared.delete(book)
    }
    
//    func getFavorite() {
//        CoreManager.shared.load() { [weak self] books in
//            self?.favbooks = books
//            print("Favorite books Count: \(books.count)")
//
//        }
//    }
    
    func getFavorite() {
            favbooks = CoreManager.shared.load()
    }
}
