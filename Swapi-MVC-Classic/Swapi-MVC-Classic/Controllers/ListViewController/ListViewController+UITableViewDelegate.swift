//
//  ListViewController+UITableViewDelegate.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import Foundation
import UIKit

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]

        let title = person.name
        let detailOne = "Gender: " + person.gender
        let detailTwo = "Hair colour: " + person.hairColor
        let detailThree = "Eye colour: " + person.eyeColor
        let detailFour = "Skin colour: " + person.skinColor

        let detailVC = DetailViewController(withTitle: title,
                                            detailOne: detailOne,
                                            detailTwo: detailTwo,
                                            detailThree: detailThree,
                                            detailFour: detailFour)

        navigationController?.pushViewController(detailVC, animated: true)
    }

}
