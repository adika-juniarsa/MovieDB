//
//  BasePresenter.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation

class BasePresenter: BaseViewToPresenterProtocol, BaseInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var viewBase: BasePresenterToViewProtocol?
    var interactorBase: BasePresenterToInteractorProtocol?
    var routerBase: BasePresenterToRouterProtocol?
    
    // TODO: implement ViewToPresenterProtocol or InteractorToPresenterProtocol methods
}
