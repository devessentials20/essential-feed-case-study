//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by panditpakhurde on 18/04/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
