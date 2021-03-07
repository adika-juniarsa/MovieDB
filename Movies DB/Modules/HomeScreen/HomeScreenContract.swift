//
//  HomeScreenContract.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

protocol HomeScreenPresenterToViewProtocol: class {
    func setupView()
    func setupHeader()
    func setupTableView()
    func reloadTable()
}

protocol HomeScreenPresenterToInteractorProtocol: class {
    var presenter: HomeScreenInteractorToPresenterProtocol? { get set }
    func fetchGenreList(withParams params: GetGenreListRequest)
}

protocol HomeScreenInteractorToPresenterProtocol: class {
    func successFetchList(withItems items: [Genre])
    func failedFetchList(withError error: ErrorExceptionAPI)
}

protocol HomeScreenViewToPresenterProtocol: class {
    var view: HomeScreenPresenterToViewProtocol? { get set }
    var interactor: HomeScreenPresenterToInteractorProtocol? { get set }
    var router: HomeScreenPresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int
    func cellForRowAt(_ index: Int) -> String
    func selected(withIndex index: Int)
}

protocol HomeScreenPresenterToRouterProtocol: class {
    static func createModule() -> HomeScreenViewController
    func selected(withGenreId genreId: Int)
}
