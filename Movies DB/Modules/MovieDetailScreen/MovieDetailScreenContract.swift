//
//  MovieDetailScreenContract.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

protocol MovieDetailScreenPresenterToViewProtocol: class {
    func setupView(withMovie movie: Movie)
    func setupHeader()
    func reloadCollectionView()
    func setupCollectionView()
}

protocol MovieDetailScreenPresenterToInteractorProtocol: class {
    var presenter: MovieDetailScreenInteractorToPresenterProtocol? { get set }
    func getYoutubeTrailers(withParams params: GetTrailerMoviesRequest)
}

protocol MovieDetailScreenInteractorToPresenterProtocol: class {
    func successGetTrailers(withData data: [Trailer])
    func failedGetTrailers(withError error: ErrorExceptionAPI)
}

protocol MovieDetailScreenViewToPresenterProtocol: class {
    var view: MovieDetailScreenPresenterToViewProtocol? { get set }
    var interactor: MovieDetailScreenPresenterToInteractorProtocol? { get set }
    var router: MovieDetailScreenPresenterToRouterProtocol? { get set }
    var movie: Movie? { get set }
    
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func buttonBackTouchUp()
    func cellForItemAt(_ index: Int) -> Trailer?
    func numberOfItemsInSection() -> Int
    func gotoPlayer(withIndex index: Int)
    func buttonOpenUserReviews()
}

protocol MovieDetailScreenPresenterToRouterProtocol: class {
    static func createModule() -> MovieDetailScreenViewController
    func backToPreviousPage()
    func gotoYoutubePlayer(withKey key: String)
    func gotoUserReview(withIdMovie idMovie: Int)
}
