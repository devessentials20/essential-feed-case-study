//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by panditpakhurde on 25/05/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation

public class CoreDataFeedStore: FeedStore {
    
    public init() { }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        
    }

    
}
