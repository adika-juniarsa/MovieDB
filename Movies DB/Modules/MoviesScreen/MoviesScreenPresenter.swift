//
//  MoviesScreenPresenter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class MoviesScreenPresenter: BasePresenter, MoviesScreenViewToPresenterProtocol, MoviesScreenInteractorToPresenterProtocol {
   
    // MARK: Properties
    
    var view: MoviesScreenPresenterToViewProtocol?
    var interactor: MoviesScreenPresenterToInteractorProtocol?
    var router: MoviesScreenPresenterToRouterProtocol?
    var currentPage: Int = 1
    var totalPages: Int = 0
    var items: [Movie] = []
    var genreId: Int?
    var isFirstLoad: Bool = true
    
    func viewDidLoad() {
        view?.setupView()
        view?.setupTableView()
        viewBase?.showSpinnerView()
        fetchMovieList()
    }
    
    func fetchMovieList() {
        let params = GetMovieListByGenreRequest()
        params.apiKey = API.apiKey
        params.withGenres = genreId
        params.page = currentPage
        interactor?.fetchMoviesList(withParams: params)
    }
    
    func viewDidLayoutSubviews() {
        view?.setupHeader()
    }
    
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int {
        if !isFirstLoad {
            if items.isEmpty {
                viewBase?.setEmptyStateView(tableView, withMessage: "No Movies Yet!")
            } else {
                viewBase?.removeEmptyStateView(tableView)
            }
        }
        
        return items.count
    }
    
    func cellForRowAt(_ index: Int) -> Movie? {
        guard items.indices.contains(index) else { return nil }
        return items[index]
    }
    
    func buttonBackTouchUp() {
        router?.backToPreviousPage()
    }
    
    func successFetchMovies(withItem items: [Movie], withTotalPages totalPages: Int) {
        isFirstLoad = false
        viewBase?.removeSpinnerView()
        self.totalPages = totalPages
        self.items.append(contentsOf: items)
        view?.reloadTable()
    }
    
    func failedFetchMovies(withError error: ErrorExceptionAPI) {
        viewBase?.removeSpinnerView()
    }
    
    func loadMore() {
        if currentPage == totalPages {
            view?.endRefresh()
            return
        } else {
            currentPage += 1
        }
        
        fetchMovieList()
    }
    
    func showDetailPage(withIndex index: Int) {
        guard items.indices.contains(index) else { return }
        router?.gotoMovieDetail(withMovie: items[index])
    }
}
