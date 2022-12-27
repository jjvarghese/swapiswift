//
//  ListViewController+UITableViewDataSource.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import Foundation
import UIKit

extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if shouldLoadNextPage(index: indexPath.row) {
            return getLoadingCell(tableView, cellForRowAt: indexPath)
        } else {
            return getDataCell(tableView, cellForRowAt: indexPath)
        }
    }

    // MARK: - Private -

    private func getLoadingCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> LoadingTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.IDENTIFIER) as! LoadingTableViewCell

        loadData()

        return cell
    }

    private func getDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SwapiTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwapiTableViewCell.IDENTIFIER) as! SwapiTableViewCell
        let person = people[indexPath.row]

        let subtitle = "gender: " + person.gender + " eyes: " + person.eyeColor + " hair: " + person.hairColor

        cell.update(withTitle: person.name, subtitle: subtitle)

        return cell
    }

    private func shouldLoadNextPage(index: Int) -> Bool {
        return index == people.count - 1 && nextPage != nil && !isLoading
    }

}
