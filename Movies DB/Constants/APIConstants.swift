//
//  APIConstants.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation

struct API {
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "APIKEY") as! String
    static let imageRoot = "http://image.tmdb.org/t/p/w200"
}
