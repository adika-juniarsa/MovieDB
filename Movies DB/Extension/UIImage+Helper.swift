//
//  UIImage+Helper.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}
