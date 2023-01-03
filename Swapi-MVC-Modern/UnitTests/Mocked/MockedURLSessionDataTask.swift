//
//  MockedURLSessionDataTask.swift
//  UnitTests
//
//  Created by Joshua Varghese on 03.01.23.
//

import Foundation

class MockedURLSessionDataTask: URLSessionDataTaskProtocol {

    private let completion: URLSessionCompletionHandler

    init(completion: @escaping URLSessionCompletionHandler) {
        self.completion = completion
    }

    func resume() {
        completion(nil, nil, nil)
    }

}
