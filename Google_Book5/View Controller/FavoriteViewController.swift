//
//  FavoriteViewController.swift
//  Google_Book5
//
//  Created by Sky on 9/22/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavTableCell.identifier, for: indexPath) as! FavTableCell
        //TODO
        
//        let book = viewModel.books[indexPath.row]
//        viewModel.book = book
        return cell
    }
}

extension FavoriteViewController: UITableViewDelegate {

}
