//
//  ReviewsDTO.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//  
//

import Foundation
import SwiftyJSON

class ReviewsDTO: BasePaginationDTO {
    
    var items: [Review] = []
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        items = json["results"].arrayValue.compactMap({ Review(json: $0) })
    }
}
