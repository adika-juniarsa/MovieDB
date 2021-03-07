//
//  UserReviewContract.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit

protocol UserReviewPresenterToViewProtocol: class {
    func setupView()
    func setupHeader()
    func setupTableView()
    func reloadTable()
    func endRefresh()
}

protocol UserReviewPresenterToInteractorProtocol: class {
    var presenter: UserReviewInteractorToPresenterProtocol? { get set }
    func fetchReviews(withParams params: GetReviewsRequest)
}

protocol UserReviewInteractorToPresenterProtocol: class {
    func successFetchReviews(withItem items: [Review], withTotalPages totalPages: Int)
    func failedFetchReviews(withError error: ErrorExceptionAPI)
}

protocol UserReviewViewToPresenterProtocol: class {
    var view: UserReviewPresenterToViewProtocol? { get set }
    var interactor: UserReviewPresenterToInteractorProtocol? { get set }
    var router: UserReviewPresenterToRouterProtocol? { get set }
    var movieId: Int? { get set }
    
    func viewDidLayoutSubviews()
    func viewDidLoad()
    func buttonBackTouchUp()
    func numberOfRowsInSection(withTableView tableView: UITableView) -> Int
    func cellForRowAt(_ index: Int) -> Review?
    func loadMore()
}

protocol UserReviewPresenterToRouterProtocol: class {
    static func createModule() -> UserReviewViewController
    func backToPreviousPage()
}
