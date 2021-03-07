//
//  HomeScreenRouter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class HomeScreenRouter: HomeScreenPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: HomeScreenViewController?
    
    // MARK: Static methods
    
    static func createModule() -> HomeScreenViewController {
        let viewController = UIStoryboard.init(name: "HomeScreen", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        let presenter = HomeScreenPresenter()
        let router = HomeScreenRouter()
        let interactor = HomeScreenInteractor()
        
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
    
    func selected(withGenreId genreId: Int) {
        let vc = MoviesScreenRouter.createModule()
        vc.presenter?.genreId = genreId
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
