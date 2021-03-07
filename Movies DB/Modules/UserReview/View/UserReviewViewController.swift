//
//  UserReviewViewController.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit
import SVPullToRefresh

class UserReviewViewController: BaseViewController {
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    let reviewCell = "ReviewCell"
    
    var presenter: UserReviewViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
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

extension UserReviewViewController: UserReviewPresenterToViewProtocol {
    
    func setupHeader() {
        viewHeader.addBottomShadow()
    }
    
    func setupView() {
        
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: reviewCell, bundle: nil), forCellReuseIdentifier: reviewCell)
        tableView.addInfiniteScrolling { [weak self] in
            self?.presenter?.loadMore()
        }
    }
    
    func endRefresh() {
        tableView.infiniteScrollingView.stopAnimating()
    }
}

extension UserReviewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsInSection(withTableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reviewCell, for: indexPath) as! ReviewCell
        cell.setupView(withData: presenter?.cellForRowAt(indexPath.row))
        return cell
    }
}
