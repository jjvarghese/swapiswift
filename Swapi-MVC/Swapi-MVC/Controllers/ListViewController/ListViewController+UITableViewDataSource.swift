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
        return listModel?.people.count ?? 0
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

        listModel?.loadData(completion: { [weak self] in
            self?.listView?.updateUI()
        })

        return cell
    }

    private func getDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SwapiTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwapiTableViewCell.IDENTIFIER) as! SwapiTableViewCell

        if let person = listModel?.people[indexPath.row] {
            let subtitle = "gender: " + person.gender + " eyes: " + person.eyeColor + " hair: " + person.hairColor

            cell.update(withTitle: person.name, subtitle: subtitle)
        }

        return cell
    }

    private func shouldLoadNextPage(index: Int) -> Bool {
        guard let listModel = listModel else { return false }

        return index == listModel.people.count - 1 && listModel.nextPage != nil && !listModel.isLoading
    }

}
