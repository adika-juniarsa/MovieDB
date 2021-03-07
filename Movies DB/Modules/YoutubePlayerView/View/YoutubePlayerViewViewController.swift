//
//  YoutubePlayerViewViewController.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import UIKit
import youtube_ios_player_helper

class YoutubePlayerViewViewController: BaseViewController {
    
    @IBOutlet weak var YTView: YTPlayerView!
    
    // MARK: Properties
    
    var presenter: YoutubePlayerViewViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func buttonCloseTouchUp(_ sender: Any) {
        presenter?.buttonCloseTouchUp()
    }
}

extension YoutubePlayerViewViewController: YoutubePlayerViewPresenterToViewProtocol {
    
    func playVideo(withKey key: String) {
        YTView.backgroundColor = .black
        YTView.load(withVideoId: key)
        YTView.playVideo()
    }
}
