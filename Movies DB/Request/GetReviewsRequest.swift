//
//  GetReviewsRequest.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class GetReviewsRequest: BaseRequest {
    
    var apiKey: String?
    var page: Int?
    var id: Int?
    
    override func buildForParameterAPI() -> [String : AnyObject] {
        var parameters = super.buildForParameterAPI()
        parameters["api_key"] = apiKey as AnyObject
        parameters["page"] = page as AnyObject
        return parameters
    }
}
