//
//  YoutubePlayerViewContract.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit

protocol YoutubePlayerViewPresenterToViewProtocol: class {
    func playVideo(withKey key: String)
}

protocol YoutubePlayerViewPresenterToInteractorProtocol: class {
    var presenter: YoutubePlayerViewInteractorToPresenterProtocol? { get set }
    // TODO: Declare Presenter to Interactor methods
}

protocol YoutubePlayerViewInteractorToPresenterProtocol: class {
    // TODO: Declare Interactor to Presenter methods
}

protocol YoutubePlayerViewViewToPresenterProtocol: class {
    var view: YoutubePlayerViewPresenterToViewProtocol? { get set }
    var interactor: YoutubePlayerViewPresenterToInteractorProtocol? { get set }
    var router: YoutubePlayerViewPresenterToRouterProtocol? { get set }
    var key: String? { get set }
    
    func viewDidLoad()
    func buttonCloseTouchUp()
}

protocol YoutubePlayerViewPresenterToRouterProtocol: class {
    static func createModule() -> YoutubePlayerViewViewController
    func backToPreviousPage()
}
