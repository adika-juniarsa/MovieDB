//
//  UserReviewRouter.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit

class UserReviewRouter: UserReviewPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: UserReviewViewController?
    
    // MARK: Static methods
    
    static func createModule() -> UserReviewViewController {
        let viewController = UIStoryboard.init(name: "UserReview", bundle: nil).instantiateViewController(withIdentifier: "UserReviewViewController") as! UserReviewViewController
        let presenter = UserReviewPresenter()
        let router = UserReviewRouter()
        let interactor = UserReviewInteractor()
        
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
}
