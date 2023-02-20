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
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
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
}


struct StoryViewModel: Codable {
    var id: Int
}
