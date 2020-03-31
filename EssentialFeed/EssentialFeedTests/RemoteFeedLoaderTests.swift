//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 31/03/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.get(from: URL(string:"https://a-image.url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL) {    }

}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
}



class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        _ = sut.load()
        XCTAssertNotNil(client.requestedURL)
    }

}
