//
//  NetworkEnpoints.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import Foundation
import NetworkLayer

enum NetworkEndpoints {
    
    case topStories
    case newStories
    case bestStories
    case getStoryById(id: String)
   
    var requestTimeout: Float {
        
        return 20
    }
    
    var httpMethod: HTTPMethods {
        
        switch self {
        case.topStories, .newStories, .bestStories:
            return .GET
        case .getStoryById(id: _):
            return .GET
        }
    }
    
    // compose the NetworkRequest
        func createRequest(environment: Environment) -> NetworkRequest {
            var headers: Headers = [:]
            headers["Content-Type"] = "application/json"
            return NetworkRequest(url: getURL(from: environment), headers: headers, httpMethod: httpMethod)
        }
    
    // compose urls for each request
        func getURL(from environment: Environment) -> String {
            let baseUrl = environment.baseUrl
            switch self {
            case .topStories:
                return "\(baseUrl)/v0/topstories.json"
            case .newStories:
                return "\(baseUrl)/v0/newstories.json"
            case .bestStories:
                return "\(baseUrl)/v0/beststories.json"
            case .getStoryById(id: let id):
                return "\(baseUrl)/v0/item/\(id).json?print=pretty"
            }
        }
    
}
