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
        let cell = tableView.dequeueReusableCell(withIdentifier: SwapiTableViewCell.IDENTIFIER) as! SwapiTableViewCell
        let person = people[indexPath.row]

        cell.update(withTitle: person.name)

        return cell
    }

}
