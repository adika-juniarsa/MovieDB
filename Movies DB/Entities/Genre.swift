//
//  Genre.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class Genre {
    
    var id: Int?
    var name: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        id = json["id"].int
        name = json["name"].string
    }
}
