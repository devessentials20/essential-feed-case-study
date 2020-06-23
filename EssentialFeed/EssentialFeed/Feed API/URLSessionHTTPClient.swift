//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by panditpakhurde on 24/04/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(_ session: URLSession = .shared) {
        self.session = session
    }
    
    private struct UnexpectedValuesRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping(HTTPClient.Result)-> Void) {
        session.dataTask(with: url) { data,response,error in
            completion(Result {
                if let error = error {
                    throw error
                }else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                }
                else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }.resume()
    }
}

