//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by panditpakhurde on 25/05/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import CoreData

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

private class ManagedCache: NSManagedObject {
    @NSManaged var timestamp: Date
    @NSManaged var feed: NSOrderedSet
}

private class ManagedFeedImage: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var imageDescription: String?
    @NSManaged var location: String?
    @NSManaged var url: URL
    @NSManaged var cache: ManagedCache
}
