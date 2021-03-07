//
//  GenreDTO.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class GenreDTO: BaseDTO {
    
    var items: [Genre] = []
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        items = json["genres"].arrayValue.compactMap({ Genre(json: $0) })
    }
}
