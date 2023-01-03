//
//  MockedSession.swift
//  UnitTests
//
//  Created by Joshua Varghese on 03.01.23.
//

import Foundation

class MockedURLSession: URLSessionProtocol {

    func dataTask(with url: URLRequest,
                  completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol {
        return MockedURLSessionDataTask(completion: completionHandler)
    }

}
