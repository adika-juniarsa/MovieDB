//
//  TrailersDTO.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class TrailersDTO: BaseDTO {
    
    var items: [Trailer] = []
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        items = json["results"].arrayValue.compactMap({ Trailer(json: $0) })
    }
}
