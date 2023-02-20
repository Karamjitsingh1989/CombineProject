//
//  StoryDetailView.swift
//  CombineProject
//
//  Created by Karamjit Singh on 20/02/23.
//

import SwiftUI

struct StoryDetailView: View {
    
    let storyId: Int
    @ObservedObject private var storyDetailViewModel: StoryDetailViewModel
    
    init(storyId: Int) {
        self.storyId = storyId
        self.storyDetailViewModel = StoryDetailViewModel(storyId: self.storyId)
    }
    
    var body: some View {
        Text(self.storyDetailViewModel.title)
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 34867706)
    }
}
