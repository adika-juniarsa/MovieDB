//
//  BaseRouter.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit

class BaseRouter: BasePresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: BaseViewController?
    
    // MARK: Static methods
    
    static func createModule() -> BaseViewController {
        let viewController = UIStoryboard.init(name: "Base", bundle: nil).instantiateViewController(withIdentifier: "BaseViewController") as! BaseViewController
        let presenter = BasePresenter()
        let router = BaseRouter()
        let interactor = BaseInteractor()
        
        viewController.presenterBase = presenter
        presenter.viewBase = viewController
        presenter.routerBase = router
        presenter.interactorBase = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
