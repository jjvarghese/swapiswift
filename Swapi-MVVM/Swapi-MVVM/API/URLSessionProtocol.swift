//
//  URLSessionProtocol.swift
//  Swapi-MVC-Modern
//
//  Created by Joshua Varghese on 03.01.23.
//

import Foundation

typealias URLSessionCompletionHandler = @Sendable (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {

    func dataTask(with url: URLRequest, completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol

}

extension URLSession: URLSessionProtocol {

    func dataTask(with url: URLRequest, completionHandler: @escaping URLSessionCompletionHandler) -> URLSessionDataTaskProtocol {
        return dataTask(with: url.url!, completionHandler: completionHandler)
    }

}
