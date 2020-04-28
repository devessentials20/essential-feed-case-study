//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by panditpakhurde on 01/04/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation

public class RemoteFeedLoader: FeedLoader {
    private let client: HTTPClient
    private let url: URL
    public enum Error: Swift.Error {
        case connectivity       //Domain Level error
        case invalidData
    }
    
    public typealias Result = LoadFeedResult
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result  in
            guard self != nil else { return }
            switch result {
            case let .success(data, response):
                completion(RemoteFeedLoader.map(data, response: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, from: response)
            return .success(items.toModels())
        } catch {
            return .failure(error)
        }
    }
    
}

private extension Array where Element == RemoteFeedItem {
    func toModels() -> [FeedItem] {
        return self.map { FeedItem(id: $0.id, description: $0.description, location: $0.location, imageURL: $0.image)}
    }
}
