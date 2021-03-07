//
//  ErrorExceptionApi.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation
import SwiftyJSON

class ErrorExceptionAPI {
        
    var statusMessage: String?
    var statusCode: Int?
    var success: Bool = false
    
    init(json: JSON? = nil) {
        if let json = json {
            statusMessage = json["status_message"].string
            statusCode = json["status_code"].int
            success = json["success"].boolValue
        }
    }
    
    func noInternetConnection() -> Bool {
        return statusCode == -1009
    }
    
    func pageNotFound() -> Bool {
        return statusCode == 404
    }
    
    func unauthorizedError() -> Bool {
        return statusCode == 401
    }
    
    func forbiddenPage() -> Bool {
        return statusCode == 403
    }
}
