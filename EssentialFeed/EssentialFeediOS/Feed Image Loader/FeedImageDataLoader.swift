//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Pakhurde Pandit on 01/08/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
