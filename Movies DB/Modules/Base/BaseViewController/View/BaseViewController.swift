//
//  BaseViewController.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    let child = SpinnerViewController()
    
    var presenterBase: BaseViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController: BasePresenterToViewProtocol {
    
    func showSpinnerView() {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeSpinnerView() {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    func setEmptyStateView(_ tableView: UITableView, withMessage message: String) {
        tableView.isScrollEnabled = false
        tableView.setEmptyMessage(message)
    }
    
    func removeEmptyStateView(_ tableView: UITableView) {
        tableView.isScrollEnabled = true
        tableView.restore()
    }
}
