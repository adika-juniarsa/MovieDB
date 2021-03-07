//
//  Movie.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import SwiftyJSON

class Movie {
    
    var originalTitle: String?
    var title: String?
    var overview: String?
    var poster: String?
    var releaseDate: String?
    var voteAverage: Float?
    var voteCount: Int?
    var id: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        
        originalTitle = json["original_title"].string
        title = json["title"].string
        overview = json["overview"].string
        poster = json["poster_path"].string
        releaseDate = json["release_date"].string
        voteAverage = json["vote_average"].float
        voteCount = json["vote_count"].int
        id = json["id"].int
    }
    
    func imageUrl() -> String {
        return "\(API.imageRoot)\(poster ?? "")"
    }
    
    func getRatings() -> String {
        return "Ratings: \(voteAverage ?? 0) (\(voteCount ?? 0) Reviews)"
    }
    
    func getReleaseDate() -> String {
        return releaseDate?.convertDate().millisecondsSince1970.timestampToString() ?? ""
    }
}
