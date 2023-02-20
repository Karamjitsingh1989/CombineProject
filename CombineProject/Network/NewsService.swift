//
//  NewsService.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import Foundation
import NetworkLayer
import Combine

class NewsService: ServiceProtocol {
    
   
    private var httpRequest: RequestHandler
    private var environment: Environment = .development
    
    // inject this for testability
      init(httpRequest: RequestHandler, environment: Environment) {
          self.httpRequest = httpRequest
          self.environment = environment
      }
    
    func fetchResult<T>(request: NetworkEndpoints) -> AnyPublisher<T, NetworkError> where T : Decodable, T : Encodable {
        
        let httpRequest = request.createRequest(environment: environment)
        return self.httpRequest.request(httpRequest)
    }
    
  
    
  
}


