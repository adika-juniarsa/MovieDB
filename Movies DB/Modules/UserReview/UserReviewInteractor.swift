//
//  UserReviewInteractor.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation

class UserReviewInteractor: UserReviewPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: UserReviewInteractorToPresenterProtocol?
    
    func fetchReviews(withParams params: GetReviewsRequest) {
        Services.instance.request(ApiMovies.getReview(request: params)) { (json) in
            let response = ReviewsDTO(json: json)
            self.presenter?.successFetchReviews(withItem: response.items, withTotalPages: response.totalPages ?? 0)
        } exception: { (error) in
            self.presenter?.failedFetchReviews(withError: error)
        }
    }
}
