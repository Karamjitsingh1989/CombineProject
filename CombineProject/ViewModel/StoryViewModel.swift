//
//  NewsStoriesID.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    
    @Published var stories = [StoryViewModel]()
    
   // @Published var storiesObject = [NewStoryDetail]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStoriesObject()
    }
   /*
    func fetchTopStories() {
        
        self.cancellable = WebService().getAllTopStories().map { storiesID in
            storiesID.map { value in
                StoryViewModel(id: value)
            }
        }.sink { _ in
        } receiveValue: { storyViewModel in
            self.stories = storyViewModel
        }
    }
    */
    func fetchTopStoriesObject() {
        
        self.cancellable = WebService().getAllTopStoriesModelObject().map { storiesID in
            storiesID.map { value in
                StoryViewModel(story:value)
            }
        }.sink { _ in
        } receiveValue: { storyViewModel in
            self.stories = storyViewModel
        }
    }
    
}


struct StoryViewModel: Codable {
    
    let story: NewStoryDetail
    
    var id: Int {
        return self.story.id ?? 0
    }
    
    var title: String {
        
        return self.story.title ?? ""
    }
    
    var url : String {
        
        return self.story.url ?? ""
    }
}
