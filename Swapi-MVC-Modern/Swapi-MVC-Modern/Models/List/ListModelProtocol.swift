//
//  ListModelProtocol.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 28.12.22.
//

import Foundation

protocol ListModelProtocol {

    var people: [Person] { get set }
    var nextPage: String? { get set }
    var isLoading: Bool { get set }
    var dataProvider: DataProvider { get }

    func loadData(completion: @escaping () -> Void)

}
