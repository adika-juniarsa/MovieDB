//
//  BasePaginationDTO.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class BasePaginationDTO: BaseDTO {
    
    var totalPages: Int?
    var totalResult: Int?
    var page: Int?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        
        totalPages = json["total_pages"].int
        totalResult = json["total_result"].int
        page = json["page"].int
    }
}
