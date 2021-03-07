//
//  MoviesScreenInteractor.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class MoviesScreenInteractor: MoviesScreenPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: MoviesScreenInteractorToPresenterProtocol?
    
    func fetchMoviesList(withParams params: GetMovieListByGenreRequest) {
        Services.instance.request(ApiMovies.getMovieListByGenre(request: params)) { (json) in
            let response = MoviesDTO(json: json)
            self.presenter?.successFetchMovies(withItem: response.items, withTotalPages: response.totalPages ?? 0)
        } exception: { (error) in
            self.presenter?.failedFetchMovies(withError: error)
        }
    }
}
