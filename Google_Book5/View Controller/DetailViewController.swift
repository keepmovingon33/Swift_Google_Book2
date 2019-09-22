//
//  DetailViewController.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    
    func setupDetail() {
        bookTitle.text = viewModel.book.volumeInfo?.title
        bookDescription.text = viewModel.book.volumeInfo?.description
        viewModel.book.getAuthors{ [weak self] aut in
            self?.bookAuthor.text = aut
        }
        viewModel.book.getBigImage { [weak self] img in
            self?.bookImage.image = img
        }
    }
    

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        let text = likeButton.titleLabel!.text!
        if text.elementsEqual("Like") {
            likeButton.setTitle("Unlike", for: .normal)
            likeButton.setTitleColor(.red, for: .normal)
          //  viewModel.favorite(book: viewModel.book)
            viewModel.like(book: viewModel.book)
        } else {
            likeButton.setTitle("Like", for: .normal)
            likeButton.setTitleColor(.blue, for: .normal)
            viewModel.unlike(book: viewModel.book)
        }
    }
    
}
