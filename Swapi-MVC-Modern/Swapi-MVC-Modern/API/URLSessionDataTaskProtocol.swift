//
//  URLSessionDataTaskProtocol.swift
//  Swapi-MVC-Modern
//
//  Created by Joshua Varghese on 03.01.23.
//

import Foundation

protocol URLSessionDataTaskProtocol {

    func resume()

}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
