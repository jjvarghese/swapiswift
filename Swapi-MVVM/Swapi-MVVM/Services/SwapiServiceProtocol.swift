//
//  DataProviderProtocol.swift
//  Swapi-MVC-Modern
//
//  Created by Joshua Varghese on 03.01.23.
//

import Foundation

protocol SwapiServiceProtocol {

    mutating func getPeople(from page: String?, completion: @escaping (Array<Person>, String?) -> Void)

}
