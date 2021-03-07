//
//  MoviesScreenViewController.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit
import SVPullToRefresh

class MoviesScreenViewController: BaseViewController {
    
    // MARK: Properties
    
    let movieCell = "MovieCell"
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MoviesScreenViewToPresenterProtocol?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presenter?.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func buttonBackTouchUp(_ sender: Any) {
        presenter?.buttonBackTouchUp()
    }
}

extension MoviesScreenViewController: MoviesScreenPresenterToViewProtocol {
    
    func endRefresh() {
        tableView.infiniteScrollingView.stopAnimating()
    }
    
    func setupView() {
        
    }
    
    func setupHeader() {
        viewHeader.addBottomShadow()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
        tableView.addInfiniteScrolling { [weak self] in
            self?.presenter?.loadMore()
        }
    }
    
    func reloadTable() {
        tableView.infiniteScrollingView.stopAnimating()
        tableView.reloadData()
    }
}

extension MoviesScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsInSection(withTableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell, for: indexPath) as! MovieCell
        cell.tag = indexPath.row
        cell.delegate = self
        cell.setupView(withData: presenter?.cellForRowAt(indexPath.row))
        return cell
    }
}

extension MoviesScreenViewController: MovieCellDelegate {
    
    func showDetailPage(withIndex index: Int) {
        presenter?.showDetailPage(withIndex: index)
    }
}
