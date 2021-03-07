//
//  GetTrailesMoviesRequest.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class GetTrailerMoviesRequest: BaseRequest {
    
    var apiKey: String?
    var id: Int?
    
    override func buildForParameterAPI() -> [String : AnyObject] {
        var parameters = super.buildForParameterAPI()
        parameters["api_key"] = apiKey as AnyObject
        return parameters
    }
}
