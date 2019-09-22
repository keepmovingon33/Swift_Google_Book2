//
//  BookTableCell.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class BookTableCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    static let identifier = "BookTableCell"
    
    var book: Book! {
        didSet {
            bookTitle.text = book.volumeInfo?.title ?? ""
            book.getAuthors{ [weak self] aut in
                self?.bookAuthor.text = aut
            }
            book.getSmallImage { [weak self] img in
                self?.bookImage.image = img
            }
        }
    }
}
