//
//  UserReviewPresenter.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit

class UserReviewPresenter: BasePresenter, UserReviewViewToPresenterProtocol, UserReviewInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: UserReviewPresenterToViewProtocol?
    var interactor: UserReviewPresenterToInteractorProtocol?
    var router: UserReviewPresenterToRouterProtocol?
    var movieId: Int?
    var currentPage: Int = 1
    var totalPages: Int = 0
    var reviews: [Review] = []
    var isFirstLoad: Bool = true
    
    func viewDidLayoutSubviews() {
        view?.setupHeader()
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setupTableView()
        viewBase?.showSpinnerView()
        fetchReviews()
    }
    
    func fetchReviews() {
        let params = GetReviewsRequest()
        params.id = movieId
        params.apiKey = API.apiKey
        params.page = currentPage
        interactor?.fetchReviews(withParams: params)
    }
    
    func buttonBackTouchUp() {
        router?.backToPreviousPage()
    }
    
    func successFetchReviews(withItem items: [Review], withTotalPages totalPages: Int) {
        isFirstLoad = false
        viewBase?.removeSpinnerView()
        self.totalPages = totalPages
        self.reviews.append(contentsOf: items)
        view?.reloadTable()
    }
    
    func failedFetchReviews(withError error: ErrorExceptionAPI) {
        viewBase?.removeSpinnerView()
    }
    
    func cellForRowAt(_ index: Int) -> Review? {
        guard reviews.indices.contains(index) else { return nil }
        return reviews[index]
    }
    
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int {
        if !isFirstLoad {
            if reviews.isEmpty {
                viewBase?.setEmptyStateView(tableView, withMessage: "No Reviews Yet!")
            } else {
                viewBase?.removeEmptyStateView(tableView)
            }
        }
        
        return reviews.count
    }
    
    func loadMore() {
        if currentPage == totalPages {
            view?.endRefresh()
            return
        } else {
            currentPage += 1
        }
        
        fetchReviews()
    }
}
