//
//  Book.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

struct BookResponse: Decodable {
    let books: [Book]
    private enum CodingKeys: String, CodingKey {
        case books = "items"
    }
}

class Book: Decodable {
    let volumeInfo: VolumeInfo
    
    func getSmallImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: volumeInfo.imageLinks.smallImage) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, _) in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }.resume()
    }
    
    func getBigImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: volumeInfo.imageLinks.bigImage) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, _) in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }.resume()
    }
}

class VolumeInfo: Decodable {
    let imageLinks: ImageLinks
    let title: String
    let authors: [String]
}

class ImageLinks: Decodable {
    let smallImage: String
    let bigImage: String
    private enum CodingKeys: String, CodingKey {
        case smallImage = "smallThumbnail"
        case bigImage = "thumbnail"
    }
}
