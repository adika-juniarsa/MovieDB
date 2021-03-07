//
//  Trailer.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class Trailer {
    
    var id: String?
    var key: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        id = json["id"].string
        key = json["key"].string
    }
    
    func getThumbnail() -> String {
        return "https://img.youtube.com/vi/\(key ?? "")/0.jpg"
    }
}
