//
//  MockedDataProvider.swift
//  Swapi-MVC-Modern
//
//  Created by Joshua Varghese on 03.01.23.
//

import Foundation

struct MockedSwapiService: SwapiServiceProtocol {

    let mockedPeople: [Person]
    let mockedNextPageUrl: String?

    init(withMockedPeople people: [Person], mockedNextPageUrl: String? = nil) {
        self.mockedPeople = people
        self.mockedNextPageUrl = mockedNextPageUrl
    }

    mutating func getPeople(from page: String?,
                            completion: @escaping (Array<Person>, String?) -> Void) {
        completion(mockedPeople, mockedNextPageUrl)
    }

}
