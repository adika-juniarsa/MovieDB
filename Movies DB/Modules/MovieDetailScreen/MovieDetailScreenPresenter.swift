//
//  MovieDetailScreenPresenter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class MovieDetailScreenPresenter: BasePresenter, MovieDetailScreenViewToPresenterProtocol, MovieDetailScreenInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: MovieDetailScreenPresenterToViewProtocol?
    var interactor: MovieDetailScreenPresenterToInteractorProtocol?
    var router: MovieDetailScreenPresenterToRouterProtocol?
    var movie: Movie?
    var trailers: [Trailer] = []
    
    func viewDidLoad() {
        view?.setupCollectionView()
        setupView()
        fetchTrailersYoutube()
    }
    
    func viewDidLayoutSubviews() {
        view?.setupHeader()
    }
    
    func fetchTrailersYoutube() {
        viewBase?.showSpinnerView()
        let params = GetTrailerMoviesRequest()
        params.apiKey = API.apiKey
        params.id = movie?.id
        interactor?.getYoutubeTrailers(withParams: params)
    }
    
    func setupView() {
        guard let movie = movie else { return }
        view?.setupView(withMovie: movie)
    }
    
    func buttonBackTouchUp() {
        router?.backToPreviousPage()
    }
    
    func successGetTrailers(withData data: [Trailer]) {
        viewBase?.removeSpinnerView()
        trailers = data
        view?.reloadCollectionView()
    }
    
    func failedGetTrailers(withError error: ErrorExceptionAPI) {
        viewBase?.removeSpinnerView()
    }
    
    func cellForItemAt(_ index: Int) -> Trailer? {
        guard trailers.indices.contains(index) else {
            return nil
        }
        return trailers[index]
    }
    
    func numberOfItemsInSection() -> Int {
        return trailers.count
    }
    
    func gotoPlayer(withIndex index: Int) {
        guard trailers.indices.contains(index) else {
            return
        }
        router?.gotoYoutubePlayer(withKey: trailers[index].key ?? "")
    }
    
    func buttonOpenUserReviews() {
        router?.gotoUserReview(withIdMovie: movie?.id ?? 0)
    }
}
