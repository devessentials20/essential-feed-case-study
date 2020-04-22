//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 22/04/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import XCTest
import EssentialFeed

protocol HTTPSession {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> HTTPSessionDataTask
}

protocol HTTPSessionDataTask {
    func resume()
}

class URLSessionHTTPClient {
    private let session: HTTPSession
    
    init(_ session: HTTPSession) {
        self.session = session
    }
    
    func get(from url: URL, completionHandler: @escaping(HTTPClientResult)-> Void) {
        session.dataTask(with: url) { _,_,error in
            if let error = error {
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
}

class URLSessionHTTPClientTests: XCTestCase {
    
    func test_getFromURL_resumeDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = HTTPSessionSpy()
        let task = HTTPSessionDataTaskSpy()
        session.stub(url: url, task: task)
        let sut = URLSessionHTTPClient(session)
        sut.get(from: url) { _ in }
        
        XCTAssertEqual(task.resumeCallCount, 1)
    }

    func test_getFromURL_failsOnRequestError() {
        let url = URL(string: "https://any-url.com")!
        let error = NSError(domain: "Any Error", code: 1)
        let session = HTTPSessionSpy()
        session.stub(url: url, error: error)
        let sut = URLSessionHTTPClient(session)
        
        let exp = expectation(description: "Wait for completion")
        sut.get(from: url) { result in
            switch result {
            case let .failure(receivedError as NSError):
                XCTAssertEqual(receivedError, error)
            default:
                XCTFail("Expected failure with error \(error), got \(result) instead")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
        
    }

    
    //MARK: Helpers
    class HTTPSessionSpy: HTTPSession {
        private var stubs = [URL: Stub]()
        private struct Stub {
            let task: HTTPSessionDataTask
            let error: Error?
        }
        
        func stub(url: URL, task: HTTPSessionDataTask = FakeHTTPSessionDataTask(), error: Error? = nil) {
            stubs[url] = Stub(task: task, error: error)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> HTTPSessionDataTask {
            guard let stub = stubs[url] else { fatalError("Couldn't find stub for \(url)") }
            completionHandler(nil, nil, stub.error)
            return stub.task
        }
    }
    
    class FakeHTTPSessionDataTask: HTTPSessionDataTask {
        
        func resume() {
            
        }
    }
    
    class HTTPSessionDataTaskSpy: HTTPSessionDataTask {
        var resumeCallCount = 0
        
        func resume() {
            resumeCallCount += 1
        }
    }
}
