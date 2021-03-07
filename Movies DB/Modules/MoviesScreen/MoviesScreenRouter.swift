//
//  MoviesScreenRouter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class MoviesScreenRouter: MoviesScreenPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: MoviesScreenViewController?
    
    // MARK: Static methods
    
    static func createModule() -> MoviesScreenViewController {
        let viewController = UIStoryboard.init(name: "MoviesScreen", bundle: nil).instantiateViewController(withIdentifier: "MoviesScreenViewController") as! MoviesScreenViewController
        let presenter = MoviesScreenPresenter()
        let router = MoviesScreenRouter()
        let interactor = MoviesScreenInteractor()
        
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
    
    func gotoMovieDetail(withMovie movie: Movie) {
        let vc = MovieDetailScreenRouter.createModule()
        vc.presenter?.movie = movie
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
