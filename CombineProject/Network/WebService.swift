//
//  WebService.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import Foundation
import Combine
import NetworkLayer

class WebService {
    
    var subscriptions = Set<AnyCancellable>()
    
   
    func getAllTopStories() -> AnyPublisher<[Int], NetworkError> {
        
        let service = NewsService(httpRequest: RequestHandler(), environment: .development)
        return service.fetchResult(request: .newStories)
        
    }
    
    func getStoryById(id: String) -> AnyPublisher<NewStoryDetail, NetworkError>  {
        
        let service = NewsService(httpRequest: RequestHandler(), environment: .development)
        return service.fetchResult(request: .getStoryById(id: id))
        
    }
    
    
    
}
