//
//  Review.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import SwiftyJSON

class Review {
    
    var author: String?
    var content: String?
    var createdAt: String?
    var authorDetails: Author?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        author = json["author"].string
        content = json["content"].string
        createdAt = json["created_at"].string
        authorDetails = Author(json: json["author_details"])
    }
    
    func getReleaseDate() -> String {
        return createdAt?.convertReviewDate().millisecondsSince1970.timestampToString() ?? ""
    }
}
