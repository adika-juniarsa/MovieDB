//
//  BaseDTO.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation
import SwiftyJSON

class BaseDTO {
    
    var success: Bool = true
    var error: ErrorExceptionAPI?
    
    init(json: JSON? = nil) {
        guard let json = json else { return }
        
        success = !json["success"].boolValue
        
        if isFailed() {
            error = ErrorExceptionAPI(json: json)
        }
    }
    
    func isFailed() -> Bool {
        return !success
    }
}

