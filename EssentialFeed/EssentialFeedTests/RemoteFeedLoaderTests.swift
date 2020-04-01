//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 31/03/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-image.url.com")!
        let (sut, client) = makeSUT(url: url)
        _ = sut.load()
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "https://a-given-image.url.com")!
        let (sut, client) = makeSUT(url: url)
        _ = sut.load()
        _ = sut.load()
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        client.error = NSError(domain: "Test", code: 0)
        var capturedError: RemoteFeedLoader.Error?
        sut.load() { error in capturedError = error }
        
        XCTAssertEqual(capturedError, .connectivity)
    }

    
    
    //MARK: Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-image.url.com")!) -> (RemoteFeedLoader, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        var error: Error?
        func get(from url: URL, completion: @escaping (Error) -> Void = { _ in }) {
            if let error = error {
                completion(error)
            }
            requestedURLs.append(url)
        }
    }

}
