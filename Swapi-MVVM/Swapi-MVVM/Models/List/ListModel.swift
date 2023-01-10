//
//  ListModel.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 28.12.22.
//

import Foundation

class ListModel: ListModelProtocol {

    var dataProvider: SwapiServiceProtocol
    var people: [Person] = []
    var nextPage: String?
    var isLoading = false

    init(withDataProvider dataProvider: SwapiServiceProtocol = SwapiService()) {
        self.dataProvider = dataProvider
    }

    func loadData(completion: @escaping () -> Void) {
        isLoading = true

        dataProvider.getPeople(from: nextPage) { [weak self] people, next in
            self?.people.append(contentsOf: people)
            self?.nextPage = next
            self?.isLoading = false

            completion()
        }
    }

}
