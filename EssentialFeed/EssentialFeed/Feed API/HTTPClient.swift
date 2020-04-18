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
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
