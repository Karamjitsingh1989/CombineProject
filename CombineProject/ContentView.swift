//
//  ContentView.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import SwiftUI

struct ContentView: View {
    
@ObservedObject private var storyListView = StoryListViewModel()
    
    
    var body: some View {
        NavigationView {
            List(self.storyListView.stories, id: \.id) { storyID in
                NavigationLink(destination: StoryDetailView(storyId: storyID.id)) {
                    Text("\(storyID.id)")
                }
            }
            .padding()
            .navigationTitle("Hacker news")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
