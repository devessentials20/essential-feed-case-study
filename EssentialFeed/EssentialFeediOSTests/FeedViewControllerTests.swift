//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Pakhurde Pandit on 23/07/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest

final class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }

}
