//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 22/04/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(_ session: URLSession) {
        self.session = session
    }
    
    func get(from url: URL) {
        session.dataTask(with: url) { _,_,_ in
        }
    }
    
}

class URLSessionHTTPClientTests: XCTestCase {
    
    func test() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session)
        sut.get(from: url)
        
        XCTAssertEqual(session.urls, [url])
    }
    
    //MARK: Helpers
    class URLSessionSpy: URLSession {
        var urls = [URL]()
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            urls.append(url)
            return FakeURLSessionDataTask()
        }
    }
    
    class FakeURLSessionDataTask: URLSessionDataTask { }
}
