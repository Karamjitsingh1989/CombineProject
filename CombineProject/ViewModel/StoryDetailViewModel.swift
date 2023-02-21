//
//  StoryDetailViewModel.swift
//  CombineProject
//
//  Created by Karamjit Singh on 20/02/23.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
    
   @Published var story: NewStoryDetail?
    
    private var cancellable: AnyCancellable?
    
    
    init() {
    }
    
    
    func fetchStoryDetail(storyId: Int) {
      
        self.cancellable = WebService().getStoryById(id: "\(storyId)").sink(receiveCompletion: { _ in
        }, receiveValue: { story in
            self.story = story
        })
    }
   
}

extension StoryDetailViewModel {
    
    var title: String {
        return self.story?.title ?? ""
    }
    
    var storyUrl: String {
        
        return self.story?.url ?? ""
    }
}
