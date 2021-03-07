//
//  MovieDetailScreenInteractor.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class MovieDetailScreenInteractor: MovieDetailScreenPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: MovieDetailScreenInteractorToPresenterProtocol?
    
    func getYoutubeTrailers(withParams params: GetTrailerMoviesRequest) {
        Services.instance.request(ApiMovies.getTrailerMovies(request: params)) { (json) in
            let request = TrailersDTO(json: json)
            self.presenter?.successGetTrailers(withData: request.items)
        } exception: { (error) in
            self.presenter?.failedGetTrailers(withError: error)
        }
    }
}
