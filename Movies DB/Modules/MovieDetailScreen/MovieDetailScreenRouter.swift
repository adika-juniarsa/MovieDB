//
//  MovieDetailScreenRouter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class MovieDetailScreenRouter: MovieDetailScreenPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: MovieDetailScreenViewController?
    
    // MARK: Static methods
    
    static func createModule() -> MovieDetailScreenViewController {
        let viewController = UIStoryboard.init(name: "MovieDetailScreen", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailScreenViewController") as! MovieDetailScreenViewController
        let presenter = MovieDetailScreenPresenter()
        let router = MovieDetailScreenRouter()
        let interactor = MovieDetailScreenInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        viewController.presenterBase = presenter
        presenter.viewBase = viewController
        
        return viewController
    }
    
    func backToPreviousPage() {
        self.view?.navigationController?.popViewController(animated: true)
    }
    
    func gotoYoutubePlayer(withKey key: String) {
        let controller = YoutubePlayerViewRouter.createModule()
        controller.presenter?.key = key
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        self.view?.present(controller, animated: true, completion: nil)
    }
    
    func gotoUserReview(withIdMovie idMovie: Int) {
        let controller = UserReviewRouter.createModule()
        controller.presenter?.movieId = idMovie
        self.view?.navigationController?.pushViewController(controller, animated: true)
    }
}
