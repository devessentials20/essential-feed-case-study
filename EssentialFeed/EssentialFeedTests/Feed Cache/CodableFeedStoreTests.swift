//
//  CodableFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 12/05/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest
import EssentialFeed

class CodableFeedStore {
    
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion) {
        completion(.empty)
    }

}

class CodableFeedStoreTests: XCTestCase {
    
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()
        
        let exp = expectation(description: "Wait for cache retrieval")
        sut.retrieve { (result) in
            switch result {
            case .empty: break
            default:
                XCTFail("Expected Empty Results, got \(result) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = CodableFeedStore()
        
        let exp = expectation(description: "Wait for cache retrieval")
        sut.retrieve { firstResult in
            sut.retrieve { secondResult in
                switch (firstResult, secondResult) {
                case (.empty, .empty):
                    break
                default:
                    XCTFail("Expected retrieving twice from empty cache to deliver same empty results, got \(firstResult) & \(secondResult) instead")
                }
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 1.0)
    }
}
