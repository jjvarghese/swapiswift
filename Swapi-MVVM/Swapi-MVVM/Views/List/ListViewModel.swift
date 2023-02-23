//
//  ListViewModel.swift
//  Swapi-MVVM
//
//  Created by Joshua Varghese on 11.01.23.
//

import Foundation

final class ListViewModel {
    
    weak var requestDelegate: ListViewRequestDelegate?
    
    private var service = SwapiService()
    private var nextUrl: String?
    
    private var state: ListViewState {
        didSet {
            self.requestDelegate?.didUpdate(with: state)
        }
    }
    
    private var people: [Person] = []
    
    init() {
        self.state = .idle
    }
    
}

extension ListViewModel {
    
    func loadData() {
        state = .loading
        
        service.getPeople(from: nextUrl, completion: { [weak self] people, nextUrl in
            self?.people = people
            self?.nextUrl = nextUrl
            self?.state = .idle
        })
    }
    
    var numberOfItems: Int {
        return people.count
    }
    
    func getInfo(for indexPath: IndexPath) -> (title: String, subtitle: String) {
        let person = people[indexPath.row]
        
        return (person.name, person.gender)
    }
}
