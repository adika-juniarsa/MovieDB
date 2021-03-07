//
//  YoutubePlayerViewPresenter.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class YoutubePlayerViewPresenter: YoutubePlayerViewViewToPresenterProtocol, YoutubePlayerViewInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    weak var view: YoutubePlayerViewPresenterToViewProtocol?
    var interactor: YoutubePlayerViewPresenterToInteractorProtocol?
    var router: YoutubePlayerViewPresenterToRouterProtocol?
    var key: String?
    
    func viewDidLoad() {
        view?.playVideo(withKey: key ?? "")
    }
    
    func buttonCloseTouchUp() {
        router?.backToPreviousPage()
    }
}
