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
        session.dataTask(with: url) { _,_,_ in }.resume()
    }
    
}

class URLSessionHTTPClientTests: XCTestCase {
    
    func test_getFromURL_createDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session)
        sut.get(from: url)
        
        XCTAssertEqual(session.urls, [url])
    }
    
    func test_getFromURL_resumeDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        session.stub(url: url, task: task)
        let sut = URLSessionHTTPClient(session)
        sut.get(from: url)
        
        XCTAssertEqual(task.resumeCallCount, 1)
    }

    
    //MARK: Helpers
    class URLSessionSpy: URLSession {
        var urls = [URL]()
        var stubs = [URL: URLSessionDataTaskSpy]()
        func stub(url: URL, task: URLSessionDataTaskSpy) {
            stubs[url] = task
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            urls.append(url)
            return stubs[url] ?? FakeURLSessionDataTask()
        }
    }
    
    class FakeURLSessionDataTask: URLSessionDataTask {
        
        override func resume() {
            
        }
    }
    
    class URLSessionDataTaskSpy: URLSessionDataTask {
        var resumeCallCount = 0
        
        override func resume() {
            resumeCallCount += 1
        }
    }
}
