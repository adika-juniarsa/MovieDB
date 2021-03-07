//
//  Services.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation
import Alamofire
import SwiftyJSON
import Reachability
import AlamofireNetworkActivityLogger

typealias SuccessResponse = (JSON?) -> Void
typealias ErrorResponse = (ErrorExceptionAPI) -> Void

class Services {
    
    class EndPoint {
        static let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
    }
    
    static let instance = Services()
    
    var alamoFireManager: Session = Session.default
    var req: Request?
    
    init() {
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.stopLogging()
        NetworkActivityLogger.shared.startLogging()
        #else
        NetworkActivityLogger.shared.level = .off
        #endif
        self.setAFconfig()
    }
    
    func setAFconfig() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // seconds
        configuration.timeoutIntervalForResource = 30
        self.alamoFireManager = Session(configuration: configuration)
    }
    
    func request(_ request: URLRequestConvertible, success:@escaping SuccessResponse, exception:@escaping ErrorResponse) {
        req = alamoFireManager.request(request).responseJSON { response in
            guard case let .failure(error) = response.result else {
                self.handleDataResponse(response: response, success: success, exception: exception)
                self.invalidateAndConfigure()
                return
            }
            self.throwExceptionError(error: error, exception: exception)
            self.invalidateAndConfigure()
        }
    }
    
    func invalidateAndConfigure() {
        self.alamoFireManager.session.finishTasksAndInvalidate()
        self.setAFconfig()
    }
    
    func cancelRequest() {
        self.alamoFireManager.session.invalidateAndCancel()
        self.setAFconfig()
    }
        
    private func handleDataResponse(response: AFDataResponse<Any>
        , success: @escaping SuccessResponse
        , exception:@escaping ErrorResponse) {
                
        if let value = response.value {
            let jsonValue = JSON(value)
            let baseApi = BaseDTO(json: jsonValue)
            if baseApi.isFailed() {
                if let errorException = baseApi.error {
                    exception(errorException)
                } else {
                    checkErrorResponse(exception: exception)
                }
            } else {
                success(jsonValue)
            }
        } else {
            checkErrorResponse(exception: exception)
        }
    }
    
    private func checkErrorResponse(exceptionError error: ErrorExceptionAPI? = nil, exception:@escaping ErrorResponse) {
        let reachability = try! Reachability()
        switch reachability.connection {
        case .unavailable, .none:
            exception(NoInternetConnectionException())
        default:
            if let error = error {
                exception(error)
            } else {
                exception(InternalServerErrorException())
            }
        }
    }
    
    func flushBeforeRequest(_ request: URLRequestConvertible, success:@escaping SuccessResponse, exception:@escaping ErrorResponse) {
        alamoFireManager.session.flush { }
        alamoFireManager.session.getAllTasks(completionHandler: { (task) in
            task.forEach { $0.cancel() }
        })
        self.request(request, success: success, exception: exception)
    }
    
    private func throwExceptionError(error: Error, exception:@escaping ErrorResponse) {
        if let error = error as? AFError {
            switch error {
            case .invalidURL(let url):
                #if DEBUG
                print("Invalid URL: \(url) - \(error.localizedDescription)")
                #endif
            case .parameterEncodingFailed(let reason):
                #if DEBUG
                print("Parameter encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
            case .multipartEncodingFailed(let reason):
                #if DEBUG
                print("Multipart encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
            case .responseValidationFailed(let reason):
                #if DEBUG
                print("Response validation failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
                
                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    #if DEBUG
                    print("Downloaded file could not be read")
                    #endif
                case .missingContentType(let acceptableContentTypes):
                    #if DEBUG
                    print("Content Type Missing: \(acceptableContentTypes)")
                    #endif
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    #if DEBUG
                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                    #endif
                case .unacceptableStatusCode(let code):
                    #if DEBUG
                    print("Response status code was unacceptable: \(code)")
                    #endif
                default:
                    break
                }
            case .responseSerializationFailed(let reason):
                #if DEBUG
                print("Response serialization failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
            default:
                break
            }
            #if DEBUG
            print("Underlying error: \(String(describing: error.underlyingError))")
            #endif
        } else if let error = error as? URLError {
            #if DEBUG
            print("URLError occurred: \(error)")
            #endif
            checkErrorResponse(exceptionError: TaskCancelErrorException(error: error), exception: exception)
            return
        } else {
            #if DEBUG
            print("Unknown error: \(String(describing: error))")
            #endif
        }
        
        checkErrorResponse(exception: exception)
    }
}

class NoInternetConnectionException: ErrorExceptionAPI {

    init() {
        super.init()
        statusCode = -1009
        success = false
        statusMessage = "No internet connection"
    }
}

class PageNotFound: ErrorExceptionAPI {

    init() {
        super.init()
        statusCode = 404
        success = false
        statusMessage = "Page not Found"
    }
}

class InternalServerErrorException: ErrorExceptionAPI {

    init() {
        super.init()
        statusCode = 500
        success = false
        statusMessage = "Server Error"
    }
}

class TaskCancelErrorException: ErrorExceptionAPI {

    init(error: URLError) {
        super.init()
        statusCode = error.errorCode
        success = false
        statusMessage = error.localizedDescription
    }
}

