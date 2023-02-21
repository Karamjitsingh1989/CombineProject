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
    
    func mergeStories(id storyIds:[Int]) -> AnyPublisher<NewStoryDetail, NetworkError> {
        
        let storyIds = Array(storyIds.prefix(50))
        
        let intialPublisher = getStoryById(id: "\(storyIds[0])")
        let remainder = Array(storyIds.dropFirst())
        
        return remainder.reduce(intialPublisher) { combined, id in
            return combined.merge(with: getStoryById(id: "\(id)")).eraseToAnyPublisher()
        }
    }
    
    
    func getStoryById(id: String) -> AnyPublisher<NewStoryDetail, NetworkError>  {
        
        let service = NewsService(httpRequest: RequestHandler(), environment: .development)
        return service.fetchResult(request: .getStoryById(id: id))
        
    }
    
    
    func getAllTopStoriesModelObject() -> AnyPublisher<[NewStoryDetail], NetworkError> {
        
        let service = NewsService(httpRequest: RequestHandler(), environment: .development)
        return service.fetchResult(request: .newStories).flatMap { storyIds in
            return self.mergeStories(id: storyIds)
        }.scan([]) { Story, stories -> [NewStoryDetail] in
            return Story + [stories]
        }.eraseToAnyPublisher()
    }
    
    
}
