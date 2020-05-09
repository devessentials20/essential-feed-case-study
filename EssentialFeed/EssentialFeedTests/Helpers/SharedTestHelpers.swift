//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by panditpakhurde on 09/05/20.
//  Copyright © 2020 Quikr. All rights reserved.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "Any Error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

