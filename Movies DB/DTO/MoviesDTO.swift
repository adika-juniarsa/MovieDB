//
//  MoviesDTO.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class MoviesDTO: BasePaginationDTO {
    
    var items: [Movie] = []
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        items = json["results"].arrayValue.compactMap({ Movie(json: $0) })
    }
}
