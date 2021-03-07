//
//  HomeScreenPresenter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class HomeScreenPresenter: BasePresenter, HomeScreenViewToPresenterProtocol, HomeScreenInteractorToPresenterProtocol {
    
    // MARK: Properties

    weak var view: HomeScreenPresenterToViewProtocol?
    var interactor: HomeScreenPresenterToInteractorProtocol?
    var router: HomeScreenPresenterToRouterProtocol?
    var items: [Genre] = []
    
    func viewDidLoad() {
        view?.setupView()
        view?.setupTableView()
        fetchGenreList()
    }
    
    func fetchGenreList() {
        viewBase?.showSpinnerView()
        let params = GetGenreListRequest()
        params.apiKey = API.apiKey
        interactor?.fetchGenreList(withParams: params)
    }
    
    func viewDidLayoutSubviews() {
        view?.setupHeader()
    }
    
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int {
        if items.isEmpty {
            viewBase?.setEmptyStateView(tableView, withMessage: "No Genre Yet!")
        } else {
            viewBase?.removeEmptyStateView(tableView)
        }
        
        return items.count
    }
    
    func cellForRowAt(_ index: Int) -> String {
        guard items.indices.contains(index) else { return "" }
        return items[index].name ?? ""
    }
    
    func successFetchList(withItems items: [Genre]) {
        viewBase?.removeSpinnerView()
        self.items = items
        view?.reloadTable()
    }
    
    func failedFetchList(withError error: ErrorExceptionAPI) {
        viewBase?.removeSpinnerView()
    }
    
    func selected(withIndex index: Int) {
        guard items.indices.contains(index) else { return }
        router?.selected(withGenreId: items[index].id ?? 0)
    }
}
