//
//  MoviesScreenContract.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

protocol MoviesScreenPresenterToViewProtocol: class {
    func setupView()
    func setupHeader()
    func setupTableView()
    func reloadTable()
    func endRefresh()
}

protocol MoviesScreenPresenterToInteractorProtocol: class {
    var presenter: MoviesScreenInteractorToPresenterProtocol? { get set }
    func fetchMoviesList(withParams params: GetMovieListByGenreRequest)
}

protocol MoviesScreenInteractorToPresenterProtocol: class {
    func successFetchMovies(withItem items: [Movie], withTotalPages totalPages: Int)
    func failedFetchMovies(withError error: ErrorExceptionAPI)
}

protocol MoviesScreenViewToPresenterProtocol: class {
    var view: MoviesScreenPresenterToViewProtocol? { get set }
    var interactor: MoviesScreenPresenterToInteractorProtocol? { get set }
    var router: MoviesScreenPresenterToRouterProtocol? { get set }
    var genreId: Int? { get set }
    
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int
    func cellForRowAt(_ index: Int) -> Movie?
    func buttonBackTouchUp()
    func loadMore()
    func showDetailPage(withIndex index: Int)
}

protocol MoviesScreenPresenterToRouterProtocol: class {
    static func createModule() -> MoviesScreenViewController
    func backToPreviousPage()
    func gotoMovieDetail(withMovie movie: Movie)
}
