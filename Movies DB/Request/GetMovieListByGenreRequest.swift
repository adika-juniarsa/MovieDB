//
//  GetMovieListByGenreRequest.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation

class GetMovieListByGenreRequest: BaseRequest {
        
    var apiKey: String?
    var sortBy: String = "popularity.desc"
    var withGenres: Int?
    var page: Int?
    
    override func buildForParameterAPI() -> [String : AnyObject] {
        var parameters = super.buildForParameterAPI()
        parameters["api_key"] = apiKey as AnyObject
        parameters["sort_by"] = sortBy as AnyObject
        parameters["with_genres"] = withGenres as AnyObject
        parameters["page"] = page as AnyObject
        return parameters
    }
}
