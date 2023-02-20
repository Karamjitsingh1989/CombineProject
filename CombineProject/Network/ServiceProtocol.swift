//
//  ServiceProtocol.swift
//  CombineProject
//
//  Created by Karamjit Singh on 19/02/23.
//

import Foundation
import Combine
import NetworkLayer

protocol ServiceProtocol {
    func fetchResult<T: Codable>(request: NetworkEndpoints) -> AnyPublisher<T, NetworkError>
}
