//
//  HomeScreenInteractor.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class HomeScreenInteractor: HomeScreenPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    weak var presenter: HomeScreenInteractorToPresenterProtocol?
    
    func fetchGenreList(withParams params: GetGenreListRequest) {
        Services.instance.request(ApiMovies.getGenreList(request: params)) { (json) in
            let response = GenreDTO(json: json)
            self.presenter?.successFetchList(withItems: response.items)
        } exception: { (error) in
            self.presenter?.failedFetchList(withError: error)
        }
    }
}
