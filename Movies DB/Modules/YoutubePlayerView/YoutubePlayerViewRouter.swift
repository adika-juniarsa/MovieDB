//
//  YoutubePlayerViewRouter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

class YoutubePlayerViewRouter: YoutubePlayerViewPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: YoutubePlayerViewViewController?
    
    // MARK: Static methods
    
    static func createModule() -> YoutubePlayerViewViewController {
        let viewController = UIStoryboard.init(name: "YoutubePlayerView", bundle: nil).instantiateViewController(withIdentifier: "YoutubePlayerViewViewController") as! YoutubePlayerViewViewController
        let presenter: YoutubePlayerViewViewToPresenterProtocol & YoutubePlayerViewInteractorToPresenterProtocol = YoutubePlayerViewPresenter()
        let router = YoutubePlayerViewRouter()
        let interactor = YoutubePlayerViewInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func backToPreviousPage() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
