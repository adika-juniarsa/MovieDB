//
//  ApiMovies.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//  
//

import Foundation
import Alamofire

enum ApiMovies: URLRequestConvertible {
    
    case getGenreList(request: GetGenreListRequest)
    case getMovieListByGenre(request: GetMovieListByGenreRequest)
    case getTrailerMovies(request: GetTrailerMoviesRequest)
    case getReview(request: GetReviewsRequest)
    
    var path: String {
        switch self {
        case .getGenreList:
            return "/genre/movie/list"
        case .getMovieListByGenre:
            return "/discover/movie"
        case .getTrailerMovies(let request):
            return "/movie/\(request.id!)/videos"
        case .getReview(let request):
            return "/movie/\(request.id!)/reviews"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getGenreList:
            return .get
        case .getMovieListByGenre:
            return .get
        case .getTrailerMovies:
            return .get
        case .getReview:
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getGenreList(let request):
            return request.buildForParameterAPI()
        case .getMovieListByGenre(let request):
            return request.buildForParameterAPI()
        case .getTrailerMovies(let request):
            return request.buildForParameterAPI()
        case .getReview(let request):
            return request.buildForParameterAPI()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Services.EndPoint.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if method == .post {
            if self.parameter.isHasParameters() {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: self.parameter, options: [])
            }
            return urlRequest
        } else {
            return try URLEncoding.default.encode(urlRequest, with: self.parameter)
        }
    }
}
