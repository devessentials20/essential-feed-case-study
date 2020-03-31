//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by panditpakhurde on 31/03/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation
enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader  {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
