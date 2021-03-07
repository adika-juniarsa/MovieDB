//
//  BaseContract.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit

protocol BasePresenterToViewProtocol: class {
    func showSpinnerView()
    func removeSpinnerView()
    func setEmptyStateView(_ tableView: UITableView, withMessage message: String)
    func removeEmptyStateView(_ tableView: UITableView)
}

protocol BasePresenterToInteractorProtocol: class {
    var presenter: BaseInteractorToPresenterProtocol? { get set }
    // TODO: Declare Presenter to Interactor methods
}

protocol BaseInteractorToPresenterProtocol: class {
    // TODO: Declare Interactor to Presenter methods
}

protocol BaseViewToPresenterProtocol: class {
    var viewBase: BasePresenterToViewProtocol? { get set }
    var interactorBase: BasePresenterToInteractorProtocol? { get set }
    var routerBase: BasePresenterToRouterProtocol? { get set }
    // TODO: Declare View to Presenter methods
}

protocol BasePresenterToRouterProtocol: class {
    static func createModule() -> BaseViewController
    // TODO: Declare Presenter to Router methods
}
