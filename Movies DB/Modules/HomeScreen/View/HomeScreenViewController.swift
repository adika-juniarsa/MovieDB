//
//  HomeScreenViewController.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class HomeScreenViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHeader: UIView!
    
    // MARK: Properties
    
    let genreCell = "GenreCell"
    
    var presenter: HomeScreenViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presenter?.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeScreenViewController: HomeScreenPresenterToViewProtocol {
    
    func setupView() {
        
    }
    
    func setupHeader() {
        viewHeader.addBottomShadow()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: genreCell, bundle: nil), forCellReuseIdentifier: genreCell)
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    
}

extension HomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfRowsInSection(withTableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: genreCell, for: indexPath) as! GenreCell
        cell.delegate = self
        cell.tag = indexPath.row
        cell.labelGenre.text = presenter!.cellForRowAt(indexPath.row)
        return cell
    }
}

extension HomeScreenViewController: GenreCellDelegate {
    
    func selected(withIndex index: Int) {
        presenter?.selected(withIndex: index)
    }
}
