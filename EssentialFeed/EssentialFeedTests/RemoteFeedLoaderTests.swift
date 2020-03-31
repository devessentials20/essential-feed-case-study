//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 31/03/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}



class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-image.url.com")!
        let client = HTTPClientSpy()
        let _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-image.url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        _ = sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }

}
