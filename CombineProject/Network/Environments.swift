//
//  Environments.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import Foundation
import NetworkLayer

extension Environment {
    
    var baseUrl: String {
          switch self {
          case .development:
              return "https://hacker-news.firebaseio.com"
          case .staging:
              return "https://hacker-news.firebaseio.com"
          case .production:
              return "https://hacker-news.firebaseio.com"
          }
      }
}
