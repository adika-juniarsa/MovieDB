//
//  Author.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import SwiftyJSON

class Author {
    
    var name: String?
    var avatarPath: String?
    var rating: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        name = json["name"].string
        avatarPath = json["avatar_path"].string
        rating = json["rating"].int
    }
}
