//
//  NewsStoryDetail.swift
//  CombineProject
//
//  Created by Karamjit Singh on 20/02/23.
//

import Foundation

struct NewStoryDetail: Codable {
    var by : String?
    var descendants :Int?
    var id: Int?
    var kids: [Int]?
    var score: Int
    var time: Int
    var title: String?
    var type: String?
    var url: String?
}
